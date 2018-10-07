#pragma once

#include <QObject>
#include "PassGenerator.h"

class PassGenWrapper : public QObject
{
  Q_OBJECT

public:
  explicit PassGenWrapper(QObject *parent = nullptr);
  Q_INVOKABLE QString GeneratePass(const QString &masterPhrase, const QString &webSiteName);

private:
  PassGenerator passGen_;
};

