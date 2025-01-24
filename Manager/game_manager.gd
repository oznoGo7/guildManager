extends Node


#Scenario
@onready var quest_details_list_main: Control = $"Quest Details List"
@onready var quest_details_list: VBoxContainer = $"Quest Details List/Quest Details List"
@onready var quests_left_lbl: Label = $"Quest Details List/Quest Details List/Quests Left_LBL"
@onready var scenario: Label = $"Quest Details List/Quest Details List/Scenario"
@onready var option_1_lbl: Label = $"Quest Details List/Quest Details List/Option 1 LBL"
@onready var option_2_lbl: Label = $"Quest Details List/Quest Details List/Option 2 LBL"
@onready var option_3_lbl: Label = $"Quest Details List/Quest Details List/Option 3 LBL"
@onready var reward_lbl: Label = $"Quest Details List/Quest Details List/Reward LBL"


#Choice Button Controls
@onready var choice_control_box: Control = $"Quest Details List/Quest Details List/Choice Control Box"
@onready var choice_1_btn: Button = $"Quest Details List/Quest Details List/Choice Control Box/HBoxContainer/Choice 1 BTN"
@onready var choice_2_btn: Button = $"Quest Details List/Quest Details List/Choice Control Box/HBoxContainer/Choice 2 BTN"
@onready var choice_3_btn: Button = $"Quest Details List/Quest Details List/Choice Control Box/HBoxContainer/Choice 3 BTN"


#EOD
@onready var eod: VBoxContainer = $EOD
@onready var no_more_quests_: Label = $"EOD/No More Quests!"
@onready var continue_btn: Button = $"EOD/HBoxContainer/Continue BTN"


#Game Over Screen
@onready var game_over: VBoxContainer = $"Game Over"
@onready var game_over_lbl: Label = $"Game Over/Game Over LBL"
@onready var main_menu: Button = $"Game Over/HBoxContainer/Main Menu"
@onready var go_quit_btn: Button = $"Game Over/HBoxContainer/GO_Quit BTN"


#Level Up Controls
@onready var level_up_options: Control = $"Level Up Options"
@onready var anim: AnimationPlayer = $"Level Up Options/anim"
@onready var adventurers_btn: Button = $"Level Up Options/VBoxContainer/HBoxContainer/Adventurers BTN"
@onready var increase_rep_btn: Button = $"Level Up Options/VBoxContainer/HBoxContainer/Increase Rep BTN"
@onready var increase_quest_count_btn: Button = $"Level Up Options/VBoxContainer/HBoxContainer/Increase Quest Count BTN"
@onready var adventurers_lbl: Label = $"Level Up Options/VBoxContainer/HBoxContainer/Adventurers BTN/Adventurers LBL"
@onready var increase_rep_lbl: Label = $"Level Up Options/VBoxContainer/HBoxContainer/Increase Rep BTN/Increase Rep LBL"
@onready var increase_quest_count_lbl: Label = $"Level Up Options/VBoxContainer/HBoxContainer/Increase Quest Count BTN/Increase Quest Count LBL"

#Guild Stats
@onready var guild_stats: Control = $"Guild Stats"
@onready var day_tracker: Label = $"Guild Stats/VBoxContainer/Day Tracker"
@onready var guild_adventurers_left_lbl: Label = $"Guild Stats/VBoxContainer/Guild Adventurers Left LBL"
@onready var guild_money_lbl: Label = $"Guild Stats/VBoxContainer/Guild Money LBL"
@onready var guild_xp_lbl: Label = $"Guild Stats/VBoxContainer/Guild XP_LBL"
@onready var guild_xp_bar: ProgressBar = $"Guild Stats/VBoxContainer/Guild_XP_BAR"
@onready var reputation_lbl: Label = $"Guild Stats/VBoxContainer/Reputation LBL"
@onready var town_reputation_bar: ProgressBar = $"Guild Stats/VBoxContainer/Town Reputation BAR"

#Build Stats
@onready var build_stats: Control = $"Build Stats"

#Weekly Scenario
@onready var weekly_scenario_vbox: VBoxContainer = $"Weekly Scenario Vbox"
@onready var weekly_scenario_title: Label = $"Weekly Scenario Vbox/Weekly Scenario Title"
@onready var weekly_scenario_lbl: Label = $"Weekly Scenario Vbox/Weekly Scenario LBL"
@onready var ws_continue_btn: Button = $"Weekly Scenario Vbox/HBoxContainer/ws Continue btn"
@onready var ws_quit_btn: Button = $"Weekly Scenario Vbox/HBoxContainer/WS_Quit BTN"

#SettingsMenu
@onready var settings_menu: Control = $"Settings Menu"


var scenario_dict = {
	1: {"title": "Struggling Merchant", "description": "A struggling merchant comes up to you and asks for your assistance in escorting some goods to the next town over.", "adventurers": 2, "reward": 100, "xp": 50},
	2: {"title": "Town Mayor", "description": "The Town Mayor comes up to you and asks for some help clearing the goblins that have settled on the edge of town.", "adventurers": 3, "reward": 300, "xp": 250},
	3: {"title": "Rat King", "description": "A group of adventurers has been overwhelmed by a swarm of rats led by a Rat King. They request immediate reinforcements.", "adventurers": 4, "reward": 500, "xp": 400},
	4: {"title": "Missing Children", "description": "The village elder has reported missing children who were last seen near the old forest. Investigate and bring them back safely.", "adventurers": 3, "reward": 400, "xp": 350},
	5: {"title": "Haunted Lighthouse", "description": "Sailors are refusing to dock their ships, claiming the lighthouse is haunted. Explore the lighthouse and dispel any spirits.", "adventurers": 4, "reward": 600, "xp": 500},
	6: {"title": "Bandit Hideout", "description": "Travelers have reported being ambushed by bandits on the King's Road. Locate their hideout and deal with the threat.", "adventurers": 5, "reward": 800, "xp": 700},
	7: {"title": "Ancient Artifact", "description": "A scholar from the local university needs protection while excavating a recently discovered ruin said to hold an ancient artifact.", "adventurers": 4, "reward": 700, "xp": 600},
	8: {"title": "Wyvern Attack", "description": "A wyvern has been terrorizing nearby farms and stealing livestock. The farmers have pooled their resources for a reward.", "adventurers": 5, "reward": 1000, "xp": 900},
	9: {"title": "Cursed Well", "description": "The town's water supply has been tainted by a cursed well. Investigate and remove the source of the curse.", "adventurers": 3, "reward": 500, "xp": 400},
	10: {"title": "Rescue the Blacksmith", "description": "The town's blacksmith has been kidnapped by a troll demanding ransom. Free them from their captor.", "adventurers": 4, "reward": 600, "xp": 550},
	11: {"title": "Plague of Undead", "description": "The graveyard has become overrun with the undead. The priest is looking for brave souls to put them to rest.", "adventurers": 5, "reward": 900, "xp": 800},
	12: {"title": "Lost Caravan", "description": "A merchant caravan never arrived at its destination. Search for it in the wilderness and uncover its fate.", "adventurers": 3, "reward": 400, "xp": 300},
	13: {"title": "Enchanted Forest", "description": "The local druids have requested aid in calming the angry spirits of an enchanted forest.", "adventurers": 4, "reward": 700, "xp": 650},
	14: {"title": "Captured Scout", "description": "A scout has gone missing while monitoring enemy movements in the mountains. Recover them or their findings.", "adventurers": 3, "reward": 600, "xp": 450},
	15: {"title": "Dragon Egg", "description": "Rumors of a dragon egg hidden in a nearby cave have drawn treasure hunters. Retrieve it before it falls into the wrong hands.", "adventurers": 4, "reward": 800, "xp": 700},
	16: {"title": "Dwarven Mine Collapse", "description": "A collapse in a dwarven mine has trapped miners. Clear the debris and rescue the survivors.", "adventurers": 4, "reward": 700, "xp": 500},
	17: {"title": "Bounty on the Rogue", "description": "A rogue assassin has fled town after committing heinous crimes. Track and capture them alive.", "adventurers": 3, "reward": 600, "xp": 450},
	18: {"title": "Magical Mishap", "description": "An apprentice wizard has accidentally summoned an elemental in the town square. Subdue the creature before it causes more damage.", "adventurers": 4, "reward": 500, "xp": 400},
	19: {"title": "Ogre Trouble", "description": "An ogre has been spotted near the farmland. Farmers request protection until the beast is dealt with.", "adventurers": 3, "reward": 400, "xp": 350},
	20: {"title": "Mystic Stones", "description": "A mysterious ruin has appeared in the hills. Investigate its origins and report back to the guild.", "adventurers": 4, "reward": 800, "xp": 600},
	21: {"title": "Giant Spider's Lair", "description": "Villagers have gone missing near the old woods. Signs point to a giant spider's lair nearby.", "adventurers": 4, "reward": 700, "xp": 550},
	22: {"title": "Festival Sabotage", "description": "A local festival is at risk of sabotage by a rival village. Ensure the festivities go smoothly.", "adventurers": 2, "reward": 300, "xp": 200},
	23: {"title": "Evil Cult Ritual", "description": "A sinister cult is rumored to be performing a ritual in the ruins outside town. Stop them before it's too late.", "adventurers": 5, "reward": 1000, "xp": 900},
	24: {"title": "Sea Serpent Sighting", "description": "Fishermen have spotted a sea serpent near the harbor. Investigate and neutralize the threat.", "adventurers": 4, "reward": 900, "xp": 750},
	25: {"title": "Stolen Artifact", "description": "A sacred artifact has been stolen from the temple. Track the thieves and recover it.", "adventurers": 3, "reward": 600, "xp": 500},
	26: {"title": "Elemental Rift", "description": "A rift to the Elemental Plane of Fire has opened near the village. Close it before the damage spreads.", "adventurers": 5, "reward": 1200, "xp": 1000},
	27: {"title": "Hag's Curse", "description": "A cursed hag has been tormenting a nearby village. Break her spell and end her reign of terror.", "adventurers": 4, "reward": 800, "xp": 700},
	28: {"title": "Hidden Treasure Map", "description": "A treasure map has been found, leading to a dungeon said to contain great riches. Explore and claim the loot.", "adventurers": 4, "reward": 1000, "xp": 850},
	29: {"title": "Werewolf Attack", "description": "A werewolf has been attacking villagers during the full moon. Hunt it down before it strikes again.", "adventurers": 5, "reward": 900, "xp": 750},
	30: {"title": "Merchant Escort", "description": "A wealthy merchant is traveling through dangerous lands and requires a strong escort to reach their destination safely.", "adventurers": 3, "reward": 500, "xp": 400},
	31: {"title": "Knights Tale", "description": "A knight stumbles into the guild's keep weary from his travels. The rest of his comerades have been decimated and he needs safe travel to the next town.", "adventurers": 2, "reward": 300, "xp": 200},
	32: {"title": "The Cursed Well", "description": "Villagers say their well has been cursed, causing anyone who drinks from it to fall ill.", "adventurers": 2, "reward": 200, "xp": 100},
	33: {"title": "Wyvern's Nest", "description": "A wyvern has nested near a trade route, attacking passing caravans.", "adventurers": 4, "reward": 400, "xp": 200},
	34: {"title": "A Thief in the Night", "description": "A skilled thief has been robbing homes in the capital. Bring them to justice.", "adventurers": 3, "reward": 250, "xp": 125},
	35: {"title": "Goblin King's Crown", "description": "The Goblin King is rallying his forces. Retrieve his crown to sow chaos among his ranks.", "adventurers": 6, "reward": 500, "xp": 300},
	36: {"title": "The Shattered Amulet", "description": "A wizard asks for help retrieving the shards of a powerful amulet scattered across dangerous locations.", "adventurers": 3, "reward": 350, "xp": 180},
	37: {"title": "The Frost Giant", "description": "A frost giant has been terrorizing mountain villages. Deal with the threat.", "adventurers": 5, "reward": 600, "xp": 350},
	38: {"title": "Defend the Outpost", "description": "An outpost near the border is under siege by enemy forces. Provide reinforcements.", "adventurers": 4, "reward": 400, "xp": 220},
	39: {"title": "The Missing Scout", "description": "A scout sent to explore a dangerous area hasn't returned. Find out what happened.", "adventurers": 2, "reward": 180, "xp": 90},
	40: {"title": "Witch's Curse", "description": "A witch has cursed a noble's family. Confront her and break the spell.", "adventurers": 3, "reward": 300, "xp": 150},
	41: {"title": "The Wandering Spirit", "description": "A ghost is haunting a forest path, scaring travelers. Put it to rest.", "adventurers": 2, "reward": 150, "xp": 75},
	42: {"title": "The Desert Tomb", "description": "An ancient tomb in the desert has been unearthed. Explore it and recover any treasures.", "adventurers": 4, "reward": 500, "xp": 250},
	43: {"title": "Pirate's Den", "description": "A group of pirates has been raiding coastal towns. Destroy their stronghold.", "adventurers": 5, "reward": 600, "xp": 300},
	44: {"title": "Lich's Minions", "description": "The undead have been rising near a forgotten crypt. Investigate the source.", "adventurers": 4, "reward": 350, "xp": 200},
	45: {"title": "Enchanted Forest", "description": "An enchanted forest has appeared overnight. Creatures within are attacking nearby farms.", "adventurers": 3, "reward": 280, "xp": 140},
	46: {"title": "Arena Challenge", "description": "A gladiatorial arena is looking for strong adventurers to compete for prizes.", "adventurers": 2, "reward": 300, "xp": 150},
	47: {"title": "Dragon Egg", "description": "A rare dragon egg has been found, but many creatures seek to claim it.", "adventurers": 4, "reward": 500, "xp": 260},
	48: {"title": "The Blacksmith's Secret", "description": "A blacksmith is crafting a legendary weapon but needs rare materials.", "adventurers": 2, "reward": 200, "xp": 100},
	49: {"title": "Rescue the Hostages", "description": "A gang of bandits has taken hostages in a remote cabin. Free them.", "adventurers": 3, "reward": 350, "xp": 180},
	50: {"title": "Volcanic Eruption", "description": "A dormant volcano has become active. Help evacuate nearby settlements.", "adventurers": 4, "reward": 400, "xp": 200},
	51: {"title": "The Broken Bridge", "description": "A bridge collapse has stranded travelers. Aid in repairs and protect the workers.", "adventurers": 2, "reward": 180, "xp": 90},
	52: {"title": "Nightmare Cult", "description": "A cult worshipping a nightmare deity is planning a ritual. Stop them before it's too late.", "adventurers": 6, "reward": 600, "xp": 300},
	53: {"title": "The Forbidden Library", "description": "A legendary library filled with forbidden knowledge has been discovered. Explore it.", "adventurers": 3, "reward": 320, "xp": 170},
	54: {"title": "Beast Hunt", "description": "A ferocious beast has been attacking hunters. Track it down and eliminate it.", "adventurers": 3, "reward": 250, "xp": 130},
	55: {"title": "The Storm Lord", "description": "A storm elemental is wreaking havoc on coastal regions. Confront and defeat it.", "adventurers": 7, "reward": 700, "xp": 350},
	56: {"title": "The Hidden Vault", "description": "A wealthy merchant seeks adventurers to retrieve treasure from a hidden vault.", "adventurers": 3, "reward": 400, "xp": 200},
	57: {"title": "Lost Expedition", "description": "An expedition to a frozen wasteland has gone missing. Investigate their fate.", "adventurers": 4, "reward": 450, "xp": 230},
	58: {"title": "The Shadow Assassin", "description": "A shadowy assassin is targeting high-ranking officials. Protect the next target.", "adventurers": 2, "reward": 300, "xp": 150},
	59: {"title": "Ancient Relic", "description": "A powerful relic is rumored to lie deep within a cursed jungle.", "adventurers": 4, "reward": 500, "xp": 260},
	60: {"title": "Meteorite Crash", "description": "A meteorite has crashed nearby, attracting dangerous creatures. Investigate its origin.", "adventurers": 3, "reward": 350, "xp": 180},
	61: {"title": "Lost Caravan", "description": "A merchant caravan has gone missing in the forest. Find it and rescue any survivors.", "adventurers": 4, "reward": 500, "xp": 250},
	62: {"title": "Goblin Siege", "description": "A goblin horde is threatening a nearby village. Help the villagers defend themselves.", "adventurers": 6, "reward": 600, "xp": 300},
	63: {"title": "Ancient Ruins", "description": "Strange noises are coming from ancient ruins. Explore them and uncover the source of the disturbance.", "adventurers": 3, "reward": 400, "xp": 200},
	64: {"title": "The Missing Heirloom", "description": "A noble family has lost a valuable heirloom. Track down the thief and retrieve it.", "adventurers": 2, "reward": 300, "xp": 150},
	65: {"title": "Plague in the Village", "description": "A mysterious illness is spreading in a small village. Find a cure before it's too late.", "adventurers": 5, "reward": 550, "xp": 275},
	66: {"title": "Bandit Leader", "description": "A notorious bandit leader has been terrorizing travelers. Bring them to justice.", "adventurers": 4, "reward": 450, "xp": 225},
	67: {"title": "Crystal Caverns", "description": "The Crystal Caverns are rumored to hold great treasures but are filled with dangerous beasts. Venture inside and recover the crystals.", "adventurers": 7, "reward": 700, "xp": 350},
	68: {"title": "Escort the Diplomat", "description": "A diplomat must be escorted safely to another city amidst threats from rival factions.", "adventurers": 4, "reward": 500, "xp": 250},
	69: {"title": "Wailing Woods", "description": "A forest is haunted by eerie wails at night. Investigate and put the spirits to rest.", "adventurers": 5, "reward": 400, "xp": 200},
	70: {"title": "Desert Oasis", "description": "An oasis in the desert is said to be cursed. Investigate the strange occurrences and protect the travelers.", "adventurers": 4, "reward": 350, "xp": 175},
	71: {"title": "Mountain Pass Ambush", "description": "Merchants traveling through the mountain pass have been ambushed. Clear the route of threats.", "adventurers": 5, "reward": 600, "xp": 300},
	72: {"title": "Runaway Experiment", "description": "A magical experiment has gone awry in a nearby lab. Contain the chaos before it spreads.", "adventurers": 4, "reward": 400, "xp": 200},
	73: {"title": "Dragon’s Hoard", "description": "A dragon’s lair has been discovered. Gather a team to raid the hoard and deal with the dragon.", "adventurers": 8, "reward": 1000, "xp": 500},
	74: {"title": "The Frozen King", "description": "A long-forgotten king has risen in the icy tundra. Stop his undead army before it marches south.", "adventurers": 6, "reward": 800, "xp": 400},
	75: {"title": "Sea Monster Attack", "description": "A massive sea monster is attacking fishing boats. Defeat it and ensure the waters are safe.", "adventurers": 6, "reward": 600, "xp": 300},
	76: {"title": "Festival Sabotage", "description": "Someone is plotting to disrupt the annual festival. Uncover their plans and stop them.", "adventurers": 4, "reward": 300, "xp": 150},
	77: {"title": "Shadow of the Tower", "description": "A mysterious tower has appeared overnight, surrounded by dark energy. Investigate its origin and purpose.", "adventurers": 6, "reward": 900, "xp": 450},
	78: {"title": "Forest Fire", "description": "A wildfire is spreading rapidly through the forest. Help the villagers contain it and rescue wildlife.", "adventurers": 5, "reward": 500, "xp": 250},
	79: {"title": "The Cursed Relic", "description": "A relic from an ancient civilization has been unearthed, but it brings misfortune. Return it to its resting place.", "adventurers": 4, "reward": 400, "xp": 200},
	80: {"title": "Warrior's Trial", "description": "The elders have issued a trial for those seeking to prove their worth. Complete the challenges to earn their respect.", "adventurers": 4, "reward": 350, "xp": 180},
	81: {"title": "Lone Scout's Journey", "description": "A lone scout is needed to deliver a crucial message across dangerous terrain. Will you take up the challenge?", "adventurers": 1, "reward": 75, "xp": 40},
	82: {"title": "Silent Hunter", "description": "A predator has been spotted near the village. Track it down and eliminate the threat.", "adventurers": 1, "reward": 85, "xp": 50},
	83: {"title": "Mushroom Forager", "description": "The alchemist needs rare mushrooms from the forest. Gather them while avoiding lurking dangers.", "adventurers": 1, "reward": 50, "xp": 30},
	84: {"title": "Lost Relic", "description": "A family heirloom has been lost in the ruins. Retrieve it without disturbing the spirits.", "adventurers": 1, "reward": 60, "xp": 35},
	85: {"title": "The Messenger", "description": "Deliver an urgent letter to the next town before sundown. Time is of the essence.", "adventurers": 1, "reward": 70, "xp": 40},
	86: {"title": "Shadow Watch", "description": "Strange noises have been heard in the woods at night. Investigate and report back.", "adventurers": 1, "reward": 65, "xp": 38},
	87: {"title": "Well of Whispers", "description": "The village well has gone silent. Descend and uncover the cause.", "adventurers": 1, "reward": 80, "xp": 45},
	88: {"title": "Farmhand Rescue", "description": "A child has wandered into the nearby hills. Bring them back safely.", "adventurers": 1, "reward": 55, "xp": 30},
	89: {"title": "Bandit Spy", "description": "A bandit camp has set up nearby. Scout their movements without being detected.", "adventurers": 1, "reward": 90, "xp": 55},
	90: {"title": "Merchant Escort", "description": "A traveling merchant needs protection on a short journey. Keep them safe.", "adventurers": 1, "reward": 75, "xp": 42},
	91: {"title": "Buried Treasure", "description": "A map has been found leading to a small cache of gold. Dig it up before someone else does.", "adventurers": 1, "reward": 95, "xp": 50},
	92: {"title": "Wounded Wolf", "description": "A wounded wolf has been seen near the village. Heal or drive it away before it causes harm.", "adventurers": 1, "reward": 60, "xp": 32},
	93: {"title": "The Silent Cave", "description": "Explore a nearby cave rumored to be haunted. Return with evidence of its secrets.", "adventurers": 1, "reward": 85, "xp": 48},
	94: {"title": "Broken Bridge", "description": "Repair the wooden bridge over the stream to reopen the trade route.", "adventurers": 1, "reward": 50, "xp": 28},
	95: {"title": "Stray Lantern", "description": "A magical lantern has been spotted in the marshes. Retrieve it before it disappears.", "adventurers": 1, "reward": 100, "xp": 60},
	96: {"title": "Elder's Request", "description": "The village elder seeks an herb that grows on a cliffside. Bring it back safely.", "adventurers": 1, "reward": 70, "xp": 40},
	97: {"title": "Siege of the Bandit Hold", "description": "A notorious bandit gang has fortified themselves in a nearby stronghold. Storm the hold and end their reign.", "adventurers": 6, "reward": 800, "xp": 500},
	98: {"title": "Ancient Guardian", "description": "An ancient stone golem has awakened near the ruins. Work together to subdue it before it wreaks havoc.", "adventurers": 7, "reward": 950, "xp": 600},
	99: {"title": "Infernal Portal", "description": "A portal to another realm has opened in the forest. Enter and seal it before more creatures come through.", "adventurers": 8, "reward": 1200, "xp": 800},
	100: {"title": "Dragon’s Hoard", "description": "A young dragon has claimed a mountain cave. Defeat it and claim its treasure.", "adventurers": 10, "reward": 1500, "xp": 1000},
	101: {"title": "Flooded Temple", "description": "A submerged temple has reemerged after the floodwaters receded. Explore it and uncover its secrets.", "adventurers": 6, "reward": 850, "xp": 520},
	102: {"title": "March of the Giants", "description": "A group of giants is approaching the village. Rally your strength and drive them back.", "adventurers": 9, "reward": 1400, "xp": 900},
	103: {"title": "Ghostly Armada", "description": "A fleet of ghost ships has appeared in the harbor. Board them and cleanse the spirits haunting them.", "adventurers": 7, "reward": 1100, "xp": 750},
	104: {"title": "Crimson Blight", "description": "A deadly blight is spreading in the nearby forest. Destroy its corrupted heart to save the land.", "adventurers": 6, "reward": 900, "xp": 540},
	105: {"title": "The Forgotten King", "description": "An undead king has risen from his crypt. Lay him to rest and retrieve the artifacts buried with him.", "adventurers": 8, "reward": 1300, "xp": 850},
	106: {"title": "The Burning Village", "description": "A neighboring village is under attack by raiders. Fight them off and save the townsfolk.", "adventurers": 10, "reward": 2000, "xp": 1500},
	107: {"title": "Cavern of Echoes", "description": "An underground cavern is filled with monsters. Clear it out to reclaim its treasures.", "adventurers": 6, "reward": 800, "xp": 500},
	108: {"title": "Stormcaller’s Wrath", "description": "A powerful storm elemental is wreaking havoc on the countryside. Defeat it before the damage spreads.", "adventurers": 7, "reward": 1000, "xp": 700},
	109: {"title": "The Warlord’s Arena", "description": "A ruthless warlord is challenging groups to combat in his arena. Defeat him and claim the glory.", "adventurers": 8, "reward": 1550, "xp": 1000},
	110: {"title": "Frozen Cavern", "description": "A frozen cavern hides a treasure guarded by frost creatures. Retrieve it without succumbing to the cold.", "adventurers": 6, "reward": 850, "xp": 540},
	111: {"title": "Siege of the Inferno Keep", "description": "A keep overrun by fire creatures threatens the nearby villages. Storm it and extinguish the threat.", "adventurers": 10, "reward": 2500, "xp": 1500}


}

var weekly_scenario = {
	1: {"title": "Recruitment", "description": "In your latest endevours the Mayor recruited some of your adventurers as his personal guard", "resource": "adventurers", "amount": -3},
	2: {"title": "Heroic Deeds", "description": "Your adventurers saved a village from bandits, earning great respect.", "resource": "reputation", "amount": .1},
	3: {"title": "Skilled Recruit", "description": "Some skilled adventurers have joined your ranks after hearing of your success.", "resource": "adventurers", "amount": 3},
	4: {"title": "Generous Donation", "description": "A wealthy merchant was so impressed by your actions that he donated gold.", "resource": "gold", "amount": 300},
	5: {"title": "Local Fame", "description": "Word of your group's heroics spreads, enhancing your reputation.", "resource": "reputation", "amount": .15},
	6: {"title": "Lucky Find", "description": "While exploring, your team stumbled upon a cache of gold.", "resource": "gold", "amount": 200},
	7: {"title": "Volunteer Adventurers", "description": "Inspired by your success, a group of volunteers joined your ranks.", "resource": "adventurers", "amount": 2},
	8: {"title": "Heavy Losses", "description": "A dangerous mission resulted in the loss of some adventurers.", "resource": "adventurers", "amount": -2},
	9: {"title": "Robbery", "description": "Your treasury was robbed while you were distracted.", "resource": "gold", "amount": -300},
	10: {"title": "Scandal", "description": "A rumor spreads about misconduct, harming your reputation.", "resource": "reputation", "amount": -.1},
	11: {"title": "Ambush", "description": "An ambush caught your adventurers off guard, reducing their numbers.", "resource": "adventurers", "amount": -3},
	12: {"title": "Expensive Repairs", "description": "Damage to your base required costly repairs.", "resource": "gold", "amount": -250},
	13: {"title": "Dishonorable Deed", "description": "A member of your group was caught acting dishonorably, hurting your reputation.", "resource": "reputation", "amount": -.15},
	14: {"title": "Recruitment Fail", "description": "Attempts to recruit new adventurers failed, leading to frustration.", "resource": "adventurers", "amount": -1}
}

var current_scenario = null
var current_weekly_scenario = null
var leveled_up = false
var is_paused = false
var quest_accepted = .05
var quest_gambled_away = .05
var quest_ignored = .03
var amount_of_rep: float


func _ready() -> void:
	randomize()
	Globals.connect("improved_menu_xp", update_reputation)
	Globals.connect("improved_food_xp", update_reputation)
	Globals.connect("improved_service_xp", update_reputation)
	Globals.connect("extra_quest_board_xp", update_reputation)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if is_paused == false:
			is_paused = true
			settings_menu.visible = true
		else:
			is_paused = false
			settings_menu.visible = false
	quests_left_lbl.text = "Quest options left in the day: " + str(Globals.quests_left)
	guild_money_lbl.text = "Guild Gold: " + str(Globals.guild_gold)
	guild_adventurers_left_lbl.text = "Adventurers Left: " + str(Globals.guild_members_left)
	day_tracker.text = "Day " + str(Globals.day)


func present_scenario():
	# Get a random key from scenario_dict
	var keys = scenario_dict.keys()
	var random_key = keys[randi() % keys.size()]
	current_scenario = scenario_dict[random_key]  # Save selected scenario for later reference

	# Get adventurer cost from the selected scenario
	Globals.guild_members_needed = current_scenario["adventurers"]

	# Update the scenario label with the selected scenario's description
	scenario.text = current_scenario["description"]

	# Update option labels as an example
	option_1_lbl.text = "Choice 1: Send Adventurers (" + str(Globals.guild_members_needed) + " needed)"
	option_2_lbl.text = "Choice 2: Negotiate a higher price (50% Success Rate)"
	option_3_lbl.text = "Choice 3: Ignore the request"
	reward_lbl.text = "Reward: " + str(current_scenario["reward"]) + " gold and " + str(current_scenario["xp"]) + " XP."
	choice_control_box.visible = true



func _on_choice_1_pressed() -> void:
	if Globals.guild_members_left >= Globals.guild_members_needed && Globals.quests_left > 0:
		Globals.guild_members_left -= Globals.guild_members_needed
		Globals.guild_gold += current_scenario["reward"]
		Globals.guild_xp += current_scenario["xp"]
		print("Adventurers sent! Guild XP increased to ", Globals.guild_xp, " and gold to ", Globals.guild_gold)
		Globals.quests_left -= 1
		Globals.town_reputation += quest_accepted
		amount_of_rep = quest_accepted
		town_reputation_bar.gained_rep = true
		choice_control_box.visible = false
		await update_xp()
		await update_reputation()
		if leveled_up == false && Globals.quests_left > 0:
			move_quest_details_list()
		else:
			level_up()
		end_of_day()
	else:
		print("Not enough guild members available!")
	Globals.save()



func _on_choice_2_pressed() -> void:
	var random_chance = randi() % 20
	if random_chance > 10:
		print("Negotiated terms. Reward increased by x2!")
		current_scenario["reward"] *= 1.25
		reward_lbl.text = "Reward: " + str(current_scenario["reward"]) + " gold and " + str(current_scenario["xp"]) + " XP."
	else:
		print("Failed Negotiations. Client has fled")
		Globals.quests_left -= 1
		Globals.town_reputation -= quest_gambled_away
		amount_of_rep = quest_gambled_away
		town_reputation_bar.gained_rep = false
		choice_control_box.visible = false
		await update_reputation()
		if Globals.quests_left > 0:
			move_quest_details_list()
		end_of_day()
	Globals.save()
	

func _on_choice_3_pressed() -> void:
	Globals.quests_left -= 1
	Globals.town_reputation -= quest_ignored
	amount_of_rep = quest_ignored
	town_reputation_bar.gained_rep = false
	choice_control_box.visible = false
	await update_reputation()
	print("Request ignored.")
	if Globals.quests_left > 0:
		move_quest_details_list()
	end_of_day()
	Globals.save()


func move_quest_details_list() -> void:
	$Audio.present_scenario_timer.start()
	quest_details_list_main.up_menu()
	guild_stats.up_menu()
	build_stats.up_menu()


func update_xp() -> void:
	print(Globals.guild_xp)
	print(current_scenario)
	if current_scenario != null:
		guild_xp_bar.change_value(current_scenario["xp"])
		await get_tree().create_timer(1.5).timeout
		guild_xp_bar.max_value = Globals.guild_xp_bar_max_value
		guild_xp_bar.value = Globals.guild_xp
		if guild_xp_bar.value >= guild_xp_bar.max_value:
			leveled_up = true
			Globals.guild_xp_bar_max_value *= 1.5
			guild_xp_bar.value = 0
			Globals.guild_xp = 0
			Globals.new_day_reputation_decrease += .01
			level_up()
	else:
		guild_xp_bar.value = Globals.guild_xp

func update_reputation() -> void:
	if current_scenario != null:
		town_reputation_bar.change_value(amount_of_rep)
		await get_tree().create_timer(1.5).timeout
		town_reputation_bar.value = Globals.town_reputation
		print("town_reputation_bar.value: " + str(town_reputation_bar.value))
		if Globals.town_reputation <= .1:
			$"Audio/Present Scenario Timer".stop()
			quest_details_list.visible = false
			eod.visible = false
			game_over.visible = true
			level_up_options.visible = false
			weekly_scenario_vbox.visible = false
		if Globals.town_reputation >= 1:
			Globals.town_reputation = 1
	else:
		town_reputation_bar.value = Globals.town_reputation

func end_of_day() -> void:
	quests_left_lbl.text = "Quest options left in the day: " + str(Globals.quests_left)
	town_reputation_bar.gained_rep = false
	if Globals.quests_left <= 0:
		quest_details_list.visible = false
		game_over.visible = false
		weekly_scenario_vbox.visible = false
		if guild_xp_bar.value == 0 && leveled_up == true:
			level_up_options.visible = true
		else:
			eod.visible = true


func level_up() -> void:
	if leveled_up == true:
		Globals.guild_level += 1
		quest_details_list.visible = false
		eod.visible = false
		game_over.visible = false
		level_up_options.visible = true
		weekly_scenario_vbox.visible = false
		adventurers_lbl.text = "Recruit more Adventurers (1-4) Cost: " + str(1000 * Globals.adventurer_upgrade)
		increase_rep_lbl.text = "Increase Reputation with the Town (20%) Cost: " + str(1000 * Globals.reputation_upgrade)
		increase_quest_count_lbl.text = "Increase Amount of Daily Quests (1) Cost: " + str(1000 * Globals.quest_count_upgrade)
		anim.play("Adventurer")


func _on_skip_pressed() -> void:
	level_up_ended()
	

func _on_main_menu_pressed() -> void:
	get_tree().get_first_node_in_group("Play Button").text = "Play"
	get_tree().get_first_node_in_group("Main Menu").get_child(1).visible = false
	get_tree().get_first_node_in_group("Game Scene").visible = false #Game Scene Root
	get_tree().get_first_node_in_group("Main Menu").visible = true
	guild_xp_bar.value = 0
	town_reputation_bar.value = .8
	Globals.reset_values()

func _on_go_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_continue_btn_pressed() -> void:
	eod.visible = false
	new_day()

func new_day() -> void:
	if Globals.day % 1 == 0:                                      ######Change
		Globals.day += 1
		give_weekly_scenario()
	else:
		Globals.day += 1
		day_tracker.text = "Day: " + str(Globals.day)
		Globals.guild_members_left = Globals.guild_members_total
		Globals.quests_left = Globals.quests_total
		Globals.town_reputation -= Globals.new_day_reputation_decrease
		update_reputation()
		move_quest_details_list()
		if Globals.town_reputation > .2:
				quest_details_list.visible = false
				eod.visible = false
				game_over.visible = false
				level_up_options.visible = false
				weekly_scenario_vbox.visible = false
		else:
			game_over.visible = true

func give_weekly_scenario():
	var keys = weekly_scenario.keys()
	var random_key = keys[randi() % keys.size()]
	current_weekly_scenario = weekly_scenario[random_key]
	
	quest_details_list.visible = false
	eod.visible = false
	game_over.visible = false
	level_up_options.visible = false
	weekly_scenario_vbox.visible = true
	weekly_scenario_title.text = current_weekly_scenario["title"]
	weekly_scenario_lbl.text = current_weekly_scenario["description"]
	match current_weekly_scenario["resource"]:
		"adventurers":
			Globals.guild_members_total += current_weekly_scenario["amount"]
			Globals.guild_members_left = Globals.guild_members_total
		"gold":
			Globals.guild_gold += current_weekly_scenario["amount"]
			if Globals.guild_gold < 0:
				Globals.guild_gold = 0
		"reputation":
			Globals.town_reputation += current_weekly_scenario["amount"]
	Globals.guild_members_left = Globals.guild_members_total
	guild_adventurers_left_lbl.text = "Adventurers Left: " + str(Globals.guild_members_left) #DO NOT REMOVE
	Globals.quests_total += 1
	Globals.quests_left = Globals.quests_total #DO NOT REMOVE
	quests_left_lbl.text = "Quest options left in the day: " + str(Globals.quests_left)
	update_reputation()
	update_xp()


func _on_adventurers_btn_pressed() -> void:
	if Globals.guild_gold > 1000 * Globals.adventurer_upgrade:
		var random_amount_of_adventurers = randi() % 4 + 1
		Globals.guild_members_total += random_amount_of_adventurers
		Globals.guild_members_left += random_amount_of_adventurers
		guild_adventurers_left_lbl.text = "Adventurers Left: " + str(Globals.guild_members_left)
		Globals.guild_gold -= 1000 * Globals.adventurer_upgrade
		Globals.adventurer_upgrade += 1
		level_up_ended()
		end_of_day()


func _on_increase_rep_btn_pressed() -> void:
	if Globals.guild_gold > 1000 * Globals.reputation_upgrade:
		Globals.guild_gold -= 1000 * Globals.reputation_upgrade
		Globals.reputation_upgrade += 1
		Globals.town_reputation += .40
		await update_reputation()
		level_up_ended()


func _on_increase_quest_count_btn_pressed() -> void:
	if Globals.guild_gold > 1000 * Globals.quest_count_upgrade:
		Globals.guild_gold -= 1000 * Globals.quest_count_upgrade
		Globals.quest_count_upgrade += 1
		Globals.quests_total += 1
		level_up_ended()


func level_up_ended() -> void:
	leveled_up = false
	if Globals.quests_left == 0:
		quest_details_list.visible = false
		eod.visible = true
		game_over.visible = false
		level_up_options.visible = false
		weekly_scenario_vbox.visible = false
	else:
		level_up_options.visible = false
		move_quest_details_list()


func _on_ws_continue_btn_pressed() -> void:
	if Globals.town_reputation > .2:
		$Audio.present_scenario_timer.start()
		move_quest_details_list()
		weekly_scenario_vbox.visible = false
		await update_reputation()
	else:
		quest_details_list.visible = false
		eod.visible = false
		game_over.visible = true
		level_up_options.visible = false
		weekly_scenario_vbox.visible = false


func _on_ws_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	if is_paused == false:
		is_paused = true
		settings_menu.visible = true
	else:
		is_paused = false
		settings_menu.visible = false
