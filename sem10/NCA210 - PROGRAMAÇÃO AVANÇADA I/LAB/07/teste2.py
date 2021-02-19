import os

import discord
from dotenv import load_dotenv

import flatlatex
c = flatlatex.converter()

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

'''
client = discord.Client()

@client.event
async def on_ready():
    print(f'{client.user} has connected to Discord!')
    for guild in client.guilds:
        print(
            f'{client.user} esta conectado nessas guildas:\n'
            f'{guild.name}(id: {guild.id})'
        )

client.run(TOKEN)
'''

class CustomClient(discord.Client):
    async def on_ready(self):
        print(f'{self.user} has connected to Discord!')

    async def on_message(self, mensagem):
        if mensagem.author == client.user:
            return

        msg_texto = mensagem.content

    async def on_member_join(self, member):
        await member.create_dm()
        await member.dm_channel.send(
            f'Olá {member.name}, bem-vindo(a) ao server!'
        )

        if msg_texto in ['eq: help']:
            resposta = '''
Esse é um bot para reescrever equações em unicode.
Ele usa notações em Latex, então para mais informações acesse:
https://www.latex-project.org/help/documentation/amsldoc.pdf
            '''

        elif msg_texto[:3] == 'eq:':
            msg_eq = mensagem.content[3:].strip()
            resposta = c.convert(msg_eq)
            print(msg_eq)
            print(resposta)
            del msg_eq

        await mensagem.channel.send(resposta)

        del msg_texto, resposta

client = CustomClient()
client.run(TOKEN)
