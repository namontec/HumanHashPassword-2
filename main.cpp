#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuickControls2/QQuickStyle>
#include <QQmlContext>
#include "PassGenWrapper.h"
#include "tools.h"

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  //QQuickStyle::setStyle("Material");

  PassGenWrapper passGenerator;

  qmlRegisterType<Tools>("ru.nmeo.Tools", 1, 0, "Tools");


  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  QQmlContext *context = engine.rootContext();
  context->setContextProperty("passGen", &passGenerator);

  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
