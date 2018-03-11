#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QAbstractItemModel>

class Settings : public QObject
{
    Q_OBJECT
public:
    class Model : public QAbstractItemModel
    {
        Q_OBJECT

        Model(Settings* p) : QObject(p), parent(p) {}

    public:
        QModelIndex index(int row, int column, const QModelIndex &parent) const override;
        QModelIndex parent(const QModelIndex &child) const override;
        int rowCount(const QModelIndex &parent = QModelIndex()) const override;
        int columnCount(const QModelIndex &parent = QModelIndex()) const override;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    private:
        Settings    parent;

    }

    explicit Settings(QObject *parent = nullptr);

    Q_INVOKABLE QAbstractItemModel* getModel();

signals:

public slots:

private:
    friend class Model;

    QSettings   storage;
};

#endif // SETTINGS_H
