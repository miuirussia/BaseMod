list n_initGui
ALOAD 0
ILOAD 2
BIPUSH 12
ISUB
BIPUSH 10
IDIV
ICONST_1
IADD

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