list n_initGui
ALOAD 0
ILOAD 2
BIPUSH 12
ISUB
BIPUSH 10
IDIV
ICONST_1
IADD
PUTFIELD net/minecraft/client/gui/inventory/GuiContainerCreative.maxPages : I

list i_initGui
ALOAD 0
ILOAD 2
BIPUSH 12
ISUB
I2D
LDC 10.0
DDIV
INVOKESTATIC java/lang/Math.ceil (D)D
D2I
PUTFIELD net/minecraft/client/gui/inventory/GuiContainerCreative.maxPages : I

list n_ModList
LDC "Mod List"

list i_ModList
LDC "fml.gui.mod_list"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

list n_ModConfig
LDC "Config"

list i_ModConfig
LDC "fml.gui.mod_config"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

list n_ModDisable
LDC "Disable"

list i_ModDisable
LDC "fml.gui.mod_disable"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;