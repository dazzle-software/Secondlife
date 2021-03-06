integer ANIMAL_CHANNEL = -999192;

integer LINK_AGE_START = 800;
integer LINK_SET_HOME = 910;      // loc ^ dist
default
{
    state_entry()
    {
        llListen(ANIMAL_CHANNEL,"","","");
    }
    
    on_rez(integer p)
    {
        llResetScript();
    }
    
    listen(integer channel, string name, key id, string message)
    {
   
        list data = llParseString2List(message,["^"],[]); 
   
    
         if (llList2String(data, 1) == "HOME_LOCATION") {
             
            llMessageLinked(LINK_SET, LINK_AGE_START, "", "");
            
            llSleep(1);
            
            vector n_home_loc = (vector)llList2String(data, 2);
            float home_dis = llList2Float(data, 3);
            vector my_loc = llGetPos();
        
            if (llGetOwnerKey(id) == llGetOwner()) {
                
                llMessageLinked(LINK_SET, LINK_SET_HOME , (string)n_home_loc + "^" + (string)home_dis, "");
            }
        } 
    }
    
    
}