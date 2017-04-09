package com.kdevlab.basemod.asm;

import codechicken.lib.asm.ASMBlock;
import com.kdevlab.repack.codechicken.lib.asm.asm.ASMReader;
import codechicken.lib.asm.ModularASMTransformer;
import codechicken.lib.asm.ObfMapping;
import net.minecraft.launchwrapper.IClassTransformer;

import java.util.Map;


/**
 * Created by kirill (KDevLab) on 03.04.17.
 */
public class ClassTransformer implements IClassTransformer {

    private ModularASMTransformer transformer = new ModularASMTransformer();

    public ClassTransformer() {
        loadTransformer();
    }

    @Override
    public byte[] transform(String name, String transformedName, byte[] bytes) {
        if (bytes == null) {
            return null;
        }

        try {
            bytes = transformer.transform(name, bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (transformedName.equals("net.minecraftforge.fml.client.GuiModList"))
            return TranslationFix.patchGuiModList(bytes);

        return bytes;
    }

    private void loadTransformer() {
        Map<String, ASMBlock> blocks = ASMReader.loadResource("/assets/kdevlab/patch.asm");
        ObfMapping mapping = new ObfMapping("net/minecraft/client/gui/inventory/GuiContainerCreative", "func_73866_w_", "()V");
        transformer.add(new ModularASMTransformer.MethodReplacer(mapping, blocks.get("n_initGui"), blocks.get("i_initGui")));
    }

}
