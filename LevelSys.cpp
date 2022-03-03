#include "../../idlib/precompiled.h"
#pragma hdrstop

#include "../Game-Mod-Q4/game/Game_local.h"
#include <cmath>
#include <iostream>

//=======================
//Level System
//=======================
class LevelSystem {

	//Singleton Start
public:
	static LevelSystem* getInstance();

	void resetValue(int val) {
		value_ = val;
		currentXP = 0;
		totalXP = 10;
		perks = 0;
		level = 1;
	}
	int getValue() { return(value_); }

protected:
	int value_;

private:
	static LevelSystem* inst_; //The one, single instance
	LevelSystem() : value_(0) {} //private constructor
	LevelSystem(const LevelSystem&);
	LevelSystem& operator = (const LevelSystem&);


	//Singleton End

protected:
	float currentXP;
	float totalXP;
	const float inflation = 1.25f;
	const float enemyKillXp = 10.0f;
	int perks;
	int level;

public:
	void increaseXP() {
		currentXP += enemyKillXp;
		gameLocal.Printf("+10XP\n");
		while (currentXP >= totalXP) {
			totalXP = round(totalXP *= inflation);
			currentXP -= totalXP;
			perks++;
			gameLocal.Printf("Level UP: +1 Perk Point!\n");
		}
		gameLocal.Printf("Level: %d%\n", level);
		gameLocal.Printf("XP:%d% / %d%\n", round(currentXP), totalXP);
		gameLocal.Printf("Perks:%d%\n", perks);
		gameLocal.Printf("-------------\n");
	}
};
//MOD End --

//Singleton restart
LevelSystem* LevelSystem::inst_ = NULL;

LevelSystem* LevelSystem::getInstance() {
	if (inst_ == NULL) {
		inst_ = new LevelSystem();
	}
	return(inst_);
}

//Singleton reend