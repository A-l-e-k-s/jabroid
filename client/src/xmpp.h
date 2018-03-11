#ifndef XMPP_H
#define XMPP_H

#include <QObject>
#include <QString>

#include <QXmppClient.h>

#include "defines.h"

class XMPP : public QObject
{
    Q_OBJECT
public:
    XMPP(QObject *parent = nullptr);

signals:
    void systemMessage(MessageType type, QString msg);

private:
    QXmppClient client;
};

#endif // XMPP_H
