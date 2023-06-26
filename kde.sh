#!/bin/bash

kwriteconfig5 --file $HOME/.config/powermanagementprofilesrc --group AC --group DPMSControl --key idleTime --delete
kwriteconfig5 --file $HOME/.config/powermanagementprofilesrc --group AC --group SuspendSession --key idleTime --key suspendType --key suspendThenHibernate --delete
qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement org.kde.Solid.PowerManagement.refreshStatus

systemsettings5 kcm_screenlocker