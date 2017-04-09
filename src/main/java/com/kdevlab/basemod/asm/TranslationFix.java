package com.kdevlab.basemod.asm;

import codechicken.lib.asm.ObfMapping;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.tree.*;

import java.util.ListIterator;

import static org.objectweb.asm.Opcodes.*;

/**
 * Created by kirill (KDevLab) on 08.04.17.
 */
public class TranslationFix {

    public static byte[] patchGuiModList(byte[] basicClass) {
        ClassNode cNode = new ClassNode();
        new ClassReader(basicClass).accept(cNode, 0);

        ObfMapping initGui = new ObfMapping("net/minecraftforge/fml/client/GuiModList", "func_73866_w_", "()V");
        ObfMapping drawScreen = new ObfMapping("net/minecraftforge/fml/client/GuiModList", "func_73863_a", "(IIF)V");

        for (MethodNode mNode : cNode.methods) {
            if (mNode.name.equals(initGui.s_name) && mNode.desc.equals(initGui.s_desc)) {
                replaceToTranslatedString(mNode, "Config", "fml.gui.mod_config");
                replaceToTranslatedString(mNode, "Disable", "fml.gui.mod_disable");
            }
            if (mNode.name.equals(drawScreen.s_name) && mNode.desc.equals(drawScreen.s_desc)) {
                replaceToTranslatedString(mNode, "Mod List", "fml.gui.mod_list");
            }
        }

        ClassWriter cWriter = new ClassWriter(ClassWriter.COMPUTE_MAXS);
        cNode.accept(cWriter);
        return cWriter.toByteArray();
    }

    private static void replaceToTranslatedString(MethodNode mNode, String from, String to) {
        ListIterator<AbstractInsnNode> iterator = mNode.instructions.iterator();
        while (iterator.hasNext())
        {
            AbstractInsnNode insn = iterator.next();
            Object cst = insn instanceof LdcInsnNode ? ((LdcInsnNode) insn).cst : null;
            if (cst != null && cst.equals(from)) {
                ObfMapping I18nFormat = new ObfMapping("net/minecraft/client/resources/I18n", "func_135052_a", "(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;");
                iterator.set(new LdcInsnNode(to));
                iterator.add(new InsnNode(ICONST_0));
                iterator.add(new TypeInsnNode(ANEWARRAY, "java/lang/Object"));
                iterator.add(new MethodInsnNode(INVOKESTATIC, I18nFormat.s_owner, I18nFormat.s_name, I18nFormat.s_desc, false));
            }
        }
    }
}
