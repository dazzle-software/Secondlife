default
{
    state_entry()
    {   
        // llSetTextureAnim() is a function that animates a texture on a face.
        llSetTextureAnim(ANIM_ON | SMOOTH | LOOP, ALL_SIDES,0,1,1.0, 0.5,1);
                 // animate the script to scroll across all the faces.
    }
 
    
}