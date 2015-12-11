package com.ajax;

import java.util.HashMap;

public class ComposerData {
    
    private HashMap composers = new HashMap();
    
    public HashMap getComposers() {
        return composers;
    }
    
    public ComposerData() {
        
		composers.put("1", new Composer("1", "Standard", "Hollywood", "Standard"));
        composers.put("2", new Composer("2", "Standard", "Cabana", "Standard"));
        composers.put("3", new Composer("3", "Standard", "Lanai", "Standard"));
		
		composers.put("4", new Composer("4", "Deluxe", "Hollywood", "Deluxe"));
		composers.put("5", new Composer("5", "Deluxe", "Cabana", "Deluxe"));
        composers.put("6", new Composer("6", "Deluxe", "Lanai", "Deluxe"));
		
        composers.put("7", new Composer("7", "Luxury", "Hollywood", "Luxury"));
        composers.put("8", new Composer("8", "Luxury", "Cabana", "Luxury"));
		composers.put("9", new Composer("9", "Luxury", "Lanai", "Luxury"));
      
        
    }
}
