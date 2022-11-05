import QtQuick 2.0
import org.kde.plasma.configuration 2.0

ConfigModel {
	ConfigCategory {
		name: i18n("General")
		icon: "configure"
		source: "config/configGeneral.qml"
	}
	ConfigCategory {
		name: i18n("URLs")
		icon: "configure"
		source: "config/configURLs.qml"
	}
}

