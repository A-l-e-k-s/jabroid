TEMPLATE = subdirs

CONFIG += ordered

SUBDIRS +=  qxmpp \
            client

client.depends = qxmpp

