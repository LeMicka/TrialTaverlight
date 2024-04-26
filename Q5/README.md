The file new_eternal_winter.lua has to be added in forgottenserver/data/spells/scripts/attack/


To make the spell usable in the game we have to add this in the file forgottenserver/data/spells/spells.xml

```xml
<instant group="attack" spellid="200" name="New Eternal Winter" words="frigo" level="60" mana="1050" premium="0" selftarget="1" casterTargetOrDirection="0" cooldown="400" groupcooldown="400" needlearn="0" script="attack/new_eternal_winter.lua">
		<vocation name="Druid" />
		<vocation name="Elder Druid" />
	</instant>
```

To use the spell you have to type frigo in the chat, and the spell is available for the characters with vocation Druid and Elder Druid.