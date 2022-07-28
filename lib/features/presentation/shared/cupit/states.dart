abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppCreateDatabaseState extends AppStates {}
class AppGetFromDatabaseLoadingState extends AppStates {}
class AppGetFromDatabaseState extends AppStates {}
class AppInsertIntoDatabaseState extends AppStates {}
class AppUpdateDatabaseTaskArchivedState extends AppStates {}
class AppChangeToFColor extends AppStates {}
class AppChangeToSColor extends AppStates {}
class AppChangeToTColor extends AppStates {}
class AppChangeToFrColor extends AppStates {}
class AppCreateColor extends AppStates {}
class AppEnableCheckBox extends AppStates {}
class AppDisableCheckBox extends AppStates {}
class AppAddToCompleted extends AppStates {}
class AppAddToFavourite extends AppStates {}
class AppAddToArchived extends AppStates {}
