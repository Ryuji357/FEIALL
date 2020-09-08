# -*- coding: utf-8 -*-
"""
Created on Tue Sep  8 14:57:23 2020

@author: Ryuji
"""

class Application(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.msg = Label(self, text="Hello World")
        self.msg.pack()
        self.bye = Button(self, text="Bye", command=self.quit)
        self.bye.pack()
        self.pack()

app = Application()
mainloop()