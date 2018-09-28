import config

from telegram.ext import *
from telegram.ext.filters import Filters
import logging
import random


def message_handler(bot, update):
    message = update['message']
    chat = message['chat']
    sticker_set = bot.get_sticker_set('best_answer_ever')
    stickers = sticker_set.stickers
    bot.send_sticker(chat['id'], random.choice(stickers), reply_to_message_id=message['message_id'])


def start():
    random.seed()

    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    updater = Updater(token=config.BOT_TOKEN)
    dispatcher = updater.dispatcher
    dispatcher.add_handler(MessageHandler(Filters.regex("(?i).*да[^\w]*$"), message_handler))
    updater.start_polling()
