#include "tools.h"

Tools::Tools(QObject *parent) : QObject(parent)
{

}

void Tools::copyToClipboard(const QString &string)
{
  QClipboard *clipboard = QGuiApplication::clipboard();
  clipboard->setText(string);
}
