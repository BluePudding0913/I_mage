# I_mage latest-version migration handoff

## Goal

I_mage を、現在の DominoEffect データパックの形式に合わせて最新バージョン対応する。

参照元:

- DominoEffect: `D:\.minecraft\saves\DominoEffect_lab\datapacks\domino-effect`
- I_mage: `D:\.minecraft\saves\I_mage_lab\datapacks\I_mage`

現時点の I_mage は `pack_format: 26` / `MC.1.20.4` 向け。DominoEffect は `pack.mcmeta` で `min_format` / `max_format` を使う新形式になっている。

## Reference Style From DominoEffect

DominoEffect で採用されている最新寄せの形式:

- `pack.mcmeta`
  - `pack_format` ではなく `min_format` / `max_format`
  - 例: `"min_format": [107, 1]`, `"max_format": [107, 1]`
- データパック内フォルダは単数形
  - `function`
  - `predicate`
  - `advancement`
  - `item_modifier`
  - `tags/function`
- item stack は NBT `tag` ではなく `components`
  - `minecraft:custom_data`
  - `minecraft:custom_name`
  - `minecraft:lore`
  - `minecraft:enchantment_glint_override`
  - `minecraft:custom_model_data` は `{ "floats": [...] }`
- global advancement も `data/global/advancement` に置く
- function macro は使用可能
  - `$function ... with storage ...`
  - `$execute ... $(value)`

## Current I_mage Snapshot

調査時点の構成:

- `.mcfunction`: 36
- `.json`: 21
- namespace: `peru.sv`
- storage: `peru.sv:`
- scoreboards: `peru.sv.*`

古い形式が残っている箇所:

- `data/minecraft/tags/functions`
- `data/peru.sv/functions`
- `data/peru.sv/predicates`
- `data/peru.sv/advancements`
- `data/peru.sv/item_modifiers`
- item NBT:
  - `SelectedItem.tag.*`
  - `Item:{...,Count:1b,tag:{...}}`
  - advancement / predicate の `"nbt": "{peru_sv_*:true}"`
- 空名 function:
  - `...\functions\rod\white_impact\.mcfunction`
  - `...\functions\rod\cannon\.mcfunction`
  - `...\functions\rod\break\.mcfunction`
  - `...\functions\rod\heal\.mcfunction`
  - `...\functions\mb\run\freeze\.mcfunction`
  - `...\functions\mb\run\thunder\.mcfunction`
  - `...\functions\mb\run\return\.mcfunction`
  - `...\functions\mb\run\collector\.mcfunction`
  - `...\functions\mb\run\protection\.mcfunction`
  - `...\functions\mb\run\inv\.mcfunction`

## Migration Order

### 1. Update pack metadata

`pack.mcmeta` を DominoEffect と同じ形式へ寄せる。

Target example:

```json
{
  "pack": {
    "description": "§6 MC.26.2",
    "min_format": [107, 1],
    "max_format": [107, 1]
  }
}
```

説明文は I_mage 用に変えてよい。形式は DominoEffect に合わせる。

### 2. Rename datapack folders

機械的に単数形へ寄せる。

| Old | New |
| --- | --- |
| `data/minecraft/tags/functions` | `data/minecraft/tags/function` |
| `data/peru.sv/functions` | `data/peru.sv/function` |
| `data/peru.sv/predicates` | `data/peru.sv/predicate` |
| `data/peru.sv/advancements` | `data/peru.sv/advancement` |
| `data/peru.sv/item_modifiers` | `data/peru.sv/item_modifier` |

Resource location は基本的に変えない。

例:

- `function peru.sv:common/tick` はそのまま
- `predicate peru.sv:rod/have` はそのまま
- `advancement revoke @s only peru.sv:player_tick` はそのまま
- `item modify entity @s weapon.mainhand peru.sv:count` はそのまま

### 3. Remove empty-name function files

`.mcfunction` という空名ファイルは最新環境で扱いが怪しい。すべて `main.mcfunction` にリネームし、参照も明示的にする。

推奨リネーム:

| Old file | New file | Old call | New call |
| --- | --- | --- | --- |
| `rod/white_impact/.mcfunction` | `rod/white_impact/main.mcfunction` | `peru.sv:rod/white_impact/` | `peru.sv:rod/white_impact/main` |
| `rod/cannon/.mcfunction` | `rod/cannon/main.mcfunction` | `peru.sv:rod/cannon/` | `peru.sv:rod/cannon/main` |
| `rod/break/.mcfunction` | `rod/break/main.mcfunction` | `peru.sv:rod/break/` | `peru.sv:rod/break/main` |
| `rod/heal/.mcfunction` | `rod/heal/main.mcfunction` | `peru.sv:rod/heal/` | `peru.sv:rod/heal/main` |
| `mb/run/freeze/.mcfunction` | `mb/run/freeze/main.mcfunction` | `peru.sv:mb/run/freeze/` | `peru.sv:mb/run/freeze/main` |
| `mb/run/thunder/.mcfunction` | `mb/run/thunder/main.mcfunction` | `peru.sv:mb/run/thunder/` | `peru.sv:mb/run/thunder/main` |
| `mb/run/return/.mcfunction` | `mb/run/return/main.mcfunction` | `peru.sv:mb/run/return/` | `peru.sv:mb/run/return/main` |
| `mb/run/collector/.mcfunction` | `mb/run/collector/main.mcfunction` | `peru.sv:mb/run/collector/` | `peru.sv:mb/run/collector/main` |
| `mb/run/protection/.mcfunction` | `mb/run/protection/main.mcfunction` | `peru.sv:mb/run/protection/` | `peru.sv:mb/run/protection/main` |
| `mb/run/inv/.mcfunction` | `mb/run/inv/main.mcfunction` | `peru.sv:mb/run/inv/` | `peru.sv:mb/run/inv/main` |

この段階で `rg "function peru\\.sv:[^\\s]+/"` を使って、末尾スラッシュの function 呼び出しが残っていないか確認する。

### 4. Convert item stacks to components

古い item NBT は最新形式へ変える。

Old summon style:

```mcfunction
summon item ~ ~ ~ {Item:{id:"minecraft:apple",Count:1b,tag:{display:{Name:'{"text":"XP_Apple"}'},peru_sv_ap:true,peru_sv_ap_p:10,Enchantments:[{}]}}}
```

New style:

```mcfunction
summon item ~ ~ ~ {Item:{id:"minecraft:apple",count:1,components:{"minecraft:custom_name":{text:"XP_Apple",color:"green",italic:false},"minecraft:custom_data":{peru_sv_ap:true,peru_sv_ap_p:10},"minecraft:enchantment_glint_override":true}}}
```

Main conversion rules:

| Old | New |
| --- | --- |
| `Count:1b` | `count:1` |
| `tag:{...}` | `components:{...}` |
| `display.Name` | `minecraft:custom_name` |
| `display.Lore` | `minecraft:lore` |
| custom marker such as `peru_sv_ap:true` | `minecraft:custom_data:{peru_sv_ap:true}` |
| fake glint via `Enchantments:[{}]` | `minecraft:enchantment_glint_override:true` |

Known files to convert:

- `function/xp_apple/item_sum.mcfunction`
- `function/mb/summon_mcr.mcfunction`
- Any remaining `summon item ... tag:{...}`
- Any remaining `give ...{...}`

`rod/summon.mcfunction` is already partly migrated and can be used as an internal example.

### 5. Update item data paths in commands

After item stack conversion, direct NBT paths must change.

| Old path | New path |
| --- | --- |
| `SelectedItem.Count` | `SelectedItem.count` |
| `SelectedItem.tag.peru_sv_ap_p` | `SelectedItem.components."minecraft:custom_data".peru_sv_ap_p` |
| `SelectedItem.tag.peru_sv_mb_sort` | `SelectedItem.components."minecraft:custom_data".peru_sv_mb_sort` |
| `Inventory[{Slot:-106b}].Count` | `Inventory[{Slot:-106b}].count` |

Known files:

- `function/xp_apple/eating.mcfunction`
- `function/xp_apple/summon.mcfunction`
- `function/mb/r_click.mcfunction`
- `function/mb/summon.mcfunction`
- `function/rod/cannon/shot.mcfunction`
- `function/rod/break/shot.mcfunction`

Keep entity paths such as `LastDeathLocation`, `NoAI`, `Motion`, `Tags` unless a reload error points at them.

### 6. Update predicates and advancement item predicates

Item predicate `nbt` for custom item tags should become `components.minecraft:custom_data`.

Old:

```json
{
  "items": ["minecraft:book"],
  "nbt": "{peru_sv_mb:true}"
}
```

New:

```json
{
  "items": ["minecraft:book"],
  "components": {
    "minecraft:custom_data": {
      "peru_sv_mb": true
    }
  }
}
```

Known files:

- `predicate/rod/have.json`
- `predicate/mb/have.json`
- `advancement/rod/r.json`
- `advancement/rod/l.json`
- `advancement/mb/r.json`
- `advancement/xp_apple/eat.json`
- `advancement/xp_apple/eating.json`
- `advancement/xp_apple/summon.json`

Entity tag checks like this can probably stay as entity NBT:

```json
"entity": {
  "type": "minecraft:interaction",
  "nbt": "{Tags:[\"peru.sv.rod\"]}"
}
```

DominoEffect still uses entity/player tag checks with `nbt`, so do not remove these blindly.

For `xp_apple/summon.json`, the old inverted `nbt: "{}"` logic is meant to avoid converting an already-custom XP Apple. Prefer checking the absence of `peru_sv_ap` specifically:

```json
{
  "condition": "minecraft:inverted",
  "term": {
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
      "equipment": {
        "mainhand": {
          "items": ["minecraft:apple"],
          "components": {
            "minecraft:custom_data": {
              "peru_sv_ap": true
            }
          }
        }
      }
    }
  }
}
```

### 7. Advancement behavior

I_mage uses advancements as event hooks:

- `player_tick.json` rewards `peru.sv:common/player_tick`
- click detection rewards:
  - `peru.sv:rod/r_click`
  - `peru.sv:rod/l_click`
  - `peru.sv:mb/r_click`
- summon/eat hooks reward feature functions

Keep the revoke pattern.

Examples:

```mcfunction
advancement revoke @s only peru.sv:player_tick
advancement revoke @s only peru.sv:rod/r
advancement revoke @s only peru.sv:xp_apple/eat
```

Folder rename from `advancements` to `advancement` does not change resource locations, so these command strings should remain valid.

### 8. Load and trigger handling

`common/load.mcfunction` currently contains:

```mcfunction
scoreboard objectives add peru.sv.uninstall trigger "Uninstall"
scoreboard players enable @s peru.sv.uninstall
```

This function is called both from the load tag and from `setup.json` advancement reward. When called from the load tag, `@s` may not be a player. Safer pattern:

```mcfunction
scoreboard players enable @a peru.sv.uninstall
```

Also consider enabling the trigger in `common/player_tick.mcfunction`, the same way DominoEffect enables/reset trigger in tick flow.

## Suggested Work Plan

1. Make a backup copy of `I_mage`.
2. Update `pack.mcmeta`.
3. Rename plural folders to singular folders.
4. Rename empty `.mcfunction` files to `main.mcfunction` and update function calls.
5. Convert item creation commands to components.
6. Convert item data reads from `.tag` / `Count` to `.components` / `count`.
7. Convert item predicates from `nbt` to `components.minecraft:custom_data`.
8. Run JSON syntax checks.
9. Run text checks for old syntax.
10. Launch world, run `/reload`, inspect `logs/latest.log`.
11. Test each feature manually.

## Text Checks Before Reload

Run these from `D:\.minecraft\saves\I_mage_lab\datapacks\I_mage`.

```powershell
rg "functions|predicates|advancements|item_modifiers" data
rg "function peru\.sv:[^\s]+/" data
rg "SelectedItem\.tag|Inventory\[\{Slot:-106b\}\]\.Count|SelectedItem\.Count" data
rg "tag:\{|CustomModelData|Enchantments:\[\{\}\]|display:\{" data
rg '"nbt": "\{peru_sv_' data
```

Expected end state:

- No plural data folders remain.
- No function call ends with `/`.
- No item-specific custom data remains under `tag`.
- No item count path uses uppercase `Count`.
- Entity tag NBT may still remain for `Tags:["peru.sv.*"]`.

## Manual Test Matrix

After `/reload`, check `logs/latest.log` first. No `Failed to load`, `Couldn't parse`, or advancement/predicate errors should appear.

Feature tests:

- Load:
  - Datapack loads without errors.
  - `say loaded I_mage` or replacement load message appears once.
- Player tick:
  - `peru.sv:common/player_tick` is repeatedly called through advancement revoke.
  - `/trigger peru.sv.uninstall` still works.
- XP Apple:
  - Sneak on enchanting table with plain apple creates XP Apple.
  - Holding/eating XP Apple runs the correct functions.
  - XP value stored in custom data is read correctly.
- Magic Wand:
  - Sneak on enchanting table with stick + lapis creates wand.
  - Right click interaction entity triggers `rod/r_click`.
  - Left click interaction entity triggers `rod/l_click`.
  - Modes `white_impact`, `cannon`, `break`, `heal` still route correctly.
- Magic Book:
  - Sneak on enchanting table with book + diamond creates book.
  - Right click reads `peru_sv_mb_sort` from custom data.
  - freeze/thunder/return/collector/protection/inv modes route correctly.
- Interaction cleanup:
  - Rod/book interaction entities disappear when the matching item is not held.

## Known Risk Areas

- `xp_apple/summon.json` old `nbt: "{}"` behavior may not exactly match the new inverted custom-data check. Decide whether "plain apple only" or "not an XP Apple" is the real intended behavior.
- Empty `.mcfunction` files are a fragile pattern. Rename all of them before serious command debugging.
- `common/tick.mcfunction` currently has `say tick`, which will spam chat. Remove or comment it out before release.
- Some comments are mojibake. Do not spend migration time fixing comments unless the surrounding command is already being edited.
- Keep namespace `peru.sv` unless intentionally making a breaking release. Changing it would require scoreboard, storage, advancement, predicate, and item custom-data migration.

## Completion Definition

Migration is complete when:

- I_mage uses the same folder conventions as DominoEffect.
- `pack.mcmeta` uses the same format style as DominoEffect.
- `/reload` succeeds with no datapack parse errors.
- All I_mage features in the manual test matrix work.
- Text checks show no old item NBT or plural-folder references except allowed entity NBT tag checks.
