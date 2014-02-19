package net.cubeforge.utils
{
	public class StringUtil
	{
		private static const LOREM_STRING:String = "lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum";
		
		static public function get_lorem (min_word:uint = 4, max_word:uint = 10, is_punctuation:Boolean = true):String
		{
			var lorem_array:Array = LOREM_STRING.split (" ");
			
			var t_array:Array = new Array ();
			var t_number:uint = Math.floor (Math.random () * (max_word - min_word + 1)) + min_word;
			var t_length:uint = 0;
			
			var is_line_end:Boolean = true;
			
			for (var i:uint = 0; i < t_number; i++)
			{
				var t_index:uint = Math.floor (Math.random () * lorem_array.length);
				var t_word:String = lorem_array [t_index];
				
				// capitalize first character if line end.
				if (is_line_end == true)
				{
					t_word = t_word.charAt (0).toUpperCase () + t_word.substr (1);
					is_line_end = false;
				}
				
				// try to add punctuation if it is flagged
				if (is_punctuation == true && t_length > (Math.random () * 2 + 2))
				{
					// add only if not approaching end of paragraph
					if (i + Math.random () * 10 < t_number)
					{
						if (Math.random () < 0.05)
						{
							if (Math.random () < 0.3)
							{
								t_word = t_word + ".";
								is_line_end = true;
							}
							else
							{
								t_word = t_word + ",";
							}
							
							t_length = 0;
						}		
					}
					
					// add if last word
					if (i + 1 == t_number)
					{
						t_word = t_word + ".";
					}
				}
				
				t_array.push (t_word);
				
				t_length = t_length + 1;
			}
			
			return (t_array.join (" "));
		}
	}
}