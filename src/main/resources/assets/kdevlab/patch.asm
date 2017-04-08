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
ALOAD 0
ALOAD 0
GETFIELD net/minecraftforge/fml/client/GuiModList.fontRendererObj : Lnet/minecraft/client/gui/FontRenderer;
LDC "Mod List"
ILOAD 4
BIPUSH 16
LDC 16777215

list i_ModList
ALOAD 0
ALOAD 0
GETFIELD net/minecraftforge/fml/client/GuiModList.fontRendererObj : Lnet/minecraft/client/gui/FontRenderer;
LDC "gui.mod_list"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
ILOAD 4
BIPUSH 16
LDC 16777215

list n_ModConfig
BIPUSH 20
LDC "Config"
INVOKESPECIAL net/minecraft/client/gui/GuiButton.<init> (IIIIILjava/lang/String;)V
PUTFIELD net/minecraftforge/fml/client/GuiModList.configModButton : Lnet/minecraft/client/gui/GuiButton;

list i_ModConfig
BIPUSH 20
LDC "gui.mod_config"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
INVOKESPECIAL net/minecraft/client/gui/GuiButton.<init> (IIIIILjava/lang/String;)V
PUTFIELD net/minecraftforge/fml/client/GuiModList.configModButton : Lnet/minecraft/client/gui/GuiButton;

list n_ModDisable
BIPUSH 20
LDC "Disable"
INVOKESPECIAL net/minecraft/client/gui/GuiButton.<init> (IIIIILjava/lang/String;)V
PUTFIELD net/minecraftforge/fml/client/GuiModList.disableModButton : Lnet/minecraft/client/gui/GuiButton;

list i_ModDisable
BIPUSH 20
LDC "gui.mod_disable"
ICONST_0
ANEWARRAY java/lang/Object
INVOKESTATIC net/minecraft/client/resources/I18n.func_135052_a (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
INVOKESPECIAL net/minecraft/client/gui/GuiButton.<init> (IIIIILjava/lang/String;)V
PUTFIELD net/minecraftforge/fml/client/GuiModList.disableModButton : Lnet/minecraft/client/gui/GuiButton;