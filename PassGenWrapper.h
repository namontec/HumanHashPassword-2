#pragma once

#include <QObject>
#include "PassGenerator.h"

class PassGenWrapper : public QObject
{
  Q_OBJECT

public:
  explicit PassGenWrapper(QObject *parent = nullptr);

public slots:
  QString generatePassword(const QString &masterPhrase, const QString &webSiteName);

private:
  PassGenerator passGen_;
};

