///////////////////////////////////////////////////////////////////////////////
// Evolutionary Breedable - Second Life Breedable Pets
//
// Copyright (C) 2013  Dazzle Software, LLC
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
///////////////////////////////////////////////////////////////////////////////

///// GLOBAL LINK CONSTANTS extracted from original source //////
///
// if you change anything, you change it everywhere and in a list in XS_Debug
///

integer LINK_AGE_START = 800;      // when quail is rezzed and secret_number, is sent by brain to breeder, eater and informatic get booted up
integer LINK_FOOD_CONSUME = 900;   // from movement to brain when close to food, brain then consumes a random amount up to 10000
integer LINK_FOODMINUS = 901;    // xs_brain  receives FOOD_CONSUME, decrement hunger (eat)
integer LINK_HUNGRY = 903;        // sent by eater (string)hunger_amount, checks each hour
integer LINK_HAMOUNT = 904;       // hunger_amount = (integer)str,m updates the hunger amount in scripts
integer LINK_SET_HOME = 910;      // loc ^ dist
integer LINK_MOVER = 911;         // tell mover to rest for str seconds
integer LINK_FOODIE_CLR = 920;    // clear all food_bowl_keys and contents
integer LINK_FOODIE = 921;        // send FOOD_LOCATION coordinates to movement
integer LINK_COLOR1 = 930;             // colour1
integer LINK_COLOR2 = 931;             // colour2
integer LINK_SEX = 932;                // sex
integer LINK_SHINE = 933;              // shine
integer LINK_GLOW = 934;               // glow
integer LINK_GEN = 935;                // generation
integer LINK_MAGE = 940;                // xs_brain sends, xs_ager consumes, adds str to age, if older than 7 days, will grow the animal
integer LINK_DAYTIME = 941;             // xs_ager consumes, starts a timer of 86,400 seconds in xs_ager
integer LINK_GET_AGE = 942;             // get age from xs_ager and sent it on channel 943
integer LINK_PUT_AGE = 943;             // print age from xs_ager
integer LINK_PACKAGE = 950;             // look for a cryo_crate
integer LINK_SEEK_FEMALE = 960;         // MALE_BREED_CALL
integer LINK_MALE_BREED_CALL = 961;     // triggered by LINK_SEEK_FEMALE
integer LINK_SIGNAL_ELIGIBLE = 962;     // sent by female when hears LINK_MALE_BREED_CALL
integer LINK_FEMALE_ELIGIBLE = 963;     // sent when it hears in chat FEMALE_ELIGIBLE
integer LINK_CALL_MALE = 964;           // if LINK_FEMALE_ELIGIBLE && looking_for_female
integer LINK_MALE_ON_THE_WAY = 965;     // triggered by LINK_CALL_MALE
integer LINK_FEMALE_LOCATION = 966;     // female location, sends coordinates of a female
integer LINK_RQST_BREED  = 967;         // sent when close enough to male/female
integer LINK_CALL_MALE_INFO = 968;      // ****** BUG  ***** read, but never sent by anybody!!!!!
                                        // see line 557 and 636 of xs_brain which make calls and also xs_breeding which receives LUNK_MALE_INFO.
integer LINK_MALE_INFO = 969;
integer LINK_LAY_EGG = 970;             // llRezObject("XS Egg"
integer LINK_BREED_FAIL = 971;          // key = father, failed, timed out
integer LINK_PREGNANT = 972;            // chick is preggers
integer LINK_SLEEPING = 990;            // close eyes 
integer LINK_UNSLEEPING = 991;          // open eyes
integer LINK_SOUND = 1001;              // plays a sound if enabled
integer LINK_SPECIAL = 1010;            // xs_special, is str = "Normal", removes script
integer LINK_PREGNANCY_TIME = 5000;    // in seconds as str
integer LINK_SLEEP = 7999;              // disable sleep by parameter
integer LINK_TIMER = 8000;              // scan for food bowl about every 1800 seconds
integer LINK_DIE = 9999;                // death


///////// end global Link constants ////////

// END //


integer SECONDS_BETWEEN_FOOD_NORMAL = 14400;
integer SECONDS_BETWEEN_FOOD_HUNGRY = 3600;

integer hunger_amount;
integer seconds_elapsed_normal;
integer seconds_elapsed_hungry;

default
{
    link_message(integer sender, integer num, string str, key id)
    {
        if (num == LINK_AGE_START) {
            state running;
        }
    }
}

state running
{
    state_entry()
    {
        hunger_amount = 0;
        seconds_elapsed_normal = 0;
        seconds_elapsed_hungry = 0;
        llSetTimerEvent(1.0);
    }

    timer()
    {
        integer do_message = 0;

        if (hunger_amount > 0) {
            if (seconds_elapsed_hungry == SECONDS_BETWEEN_FOOD_HUNGRY) {
                do_message = 1;
                seconds_elapsed_hungry = 0;
            } else {
                seconds_elapsed_hungry++;
            }
        }

        if (seconds_elapsed_normal == SECONDS_BETWEEN_FOOD_NORMAL) {
            hunger_amount++;
            seconds_elapsed_normal = 0;
        } else {
            seconds_elapsed_normal++;
        }

        if (do_message == 1) {
            llMessageLinked(LINK_SET, LINK_HUNGRY, (string)hunger_amount, "");
        }
    }

    link_message(integer sender, integer num, string str, key id)
    {
        if (num == LINK_FOODMINUS) {
            hunger_amount --;
        } else
        if (num == LINK_HAMOUNT) {
            hunger_amount = (integer)str;
        }
    }
}