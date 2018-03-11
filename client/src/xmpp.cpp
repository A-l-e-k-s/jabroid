#include "xmpp.h"

#include <QXmppLogger.h>

XMPP::XMPP(QObject *parent)
    : QObject(parent)
{
    client.logger()->setLoggingType(QXmppLogger::StdoutLogging);
}
