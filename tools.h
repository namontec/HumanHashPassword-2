#ifndef TOOLS_H
#define TOOLS_H

#include <QGuiApplication>
#include <QObject>
#include <QClipboard>

class Tools : public QObject
{
  Q_OBJECT
public:
  explicit Tools(QObject *parent = nullptr);

signals:

public slots:
  void copyToClipboard(const QString &string);

};

#endif // TOOLS_H
