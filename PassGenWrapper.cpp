#include "PassGenWrapper.h"

PassGenWrapper::PassGenWrapper(QObject *parent) : QObject(parent)
{

}

QString PassGenWrapper::GeneratePass(const QString &masterPhrase, const QString &webSiteName)
{
  QString password = passGen_.GeneratePass(masterPhrase, webSiteName);
  return password;
}
