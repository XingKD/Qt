#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,2,0,0,0,1,0,0,0,
8,0,2,0,0,0,2,0,0,0,3,0,0,0,162,0,
0,0,0,0,1,0,0,0,0,0,0,0,56,0,2,0,
0,0,2,0,0,0,5,0,0,0,20,0,0,0,0,0,
1,0,0,0,0,0,0,0,118,0,0,0,0,0,1,0,
0,0,0,0,0,0,76,0,0,0,0,0,1,0,0,0,
0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,3,0,0,86,28,0,81,0,
77,0,76,0,15,12,180,51,124,0,77,0,121,0,84,0,
101,0,115,0,116,0,84,0,97,0,98,0,108,0,101,0,
46,0,113,0,109,0,108,0,7,7,59,224,243,0,80,0,
108,0,117,0,103,0,105,0,110,0,115,0,18,15,153,55,
60,0,77,0,121,0,78,0,111,0,114,0,109,0,97,0,
108,0,66,0,117,0,116,0,116,0,111,0,110,0,46,0,
113,0,109,0,108,0,19,8,151,142,220,0,77,0,121,0,
66,0,117,0,115,0,121,0,73,0,110,0,100,0,105,0,
99,0,97,0,116,0,111,0,114,0,46,0,113,0,109,0,
108,0,8,8,1,90,92,0,109,0,97,0,105,0,110,0,
46,0,113,0,109,0,108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _0x5f__main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_QML_Plugins_MyBusyIndicator_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_QML_Plugins_MyNormalButton_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_QML_MyTestTable_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/main.qml"), &QmlCacheGeneratedCode::_0x5f__main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/QML/Plugins/MyBusyIndicator.qml"), &QmlCacheGeneratedCode::_0x5f_QML_Plugins_MyBusyIndicator_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/QML/Plugins/MyNormalButton.qml"), &QmlCacheGeneratedCode::_0x5f_QML_Plugins_MyNormalButton_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/QML/MyTestTable.qml"), &QmlCacheGeneratedCode::_0x5f_QML_MyTestTable_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    return 1;
}
