LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
	PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 neg : IN STD_LOGIC;
			 leds1 : OUT STD_LOGIC_VECTOR(0 to 6);
			 leds2 : OUT STD_LOGIC_VECTOR(0 to 6)); --pos/neg indicator
			 
	end sseg;
	
	ARCHITECTURE Behavior OF sseg IS
	BEGIN
		PROCESS (bcd, neg)
		BEGIN
		
			if (neg = '1') then
				leds2 <= ("1111110"); --neg
			else
				leds2 <= ("1111111"); --pos
			end if;
		
			CASE bcd IS   			 -- 0123456789abcdefg
				WHEN "0000" =>leds1<= "0000001"; -- 0
				WHEN "0001" =>leds1<= "1001111"; -- 1
				WHEN "0010" =>leds1<= "0010010"; -- 2
				WHEN "0011" =>leds1<= "0000110"; -- 3
				WHEN "0100" =>leds1<= "1001100"; -- 4
				WHEN "0101" =>leds1<= "0100100"; -- 5
				WHEN "0110" =>leds1<= "0100000"; -- 6	
				WHEN "0111" =>leds1<= "0001111"; -- 7
				WHEN "1000" =>leds1<= "0000000"; -- 8
				WHEN "1001" =>leds1<= "0001100"; -- 9
				WHEN "1010" =>leds1<= "0001000"; -- A
				WHEN "1011" =>leds1<= "1100000"; -- B
				WHEN "1100" =>leds1<= "0110001"; -- C
				WHEN "1101" =>leds1<= "1000010"; -- D
				WHEN "1110" =>leds1<= "0110000"; -- E
				WHEN "1111" =>leds1<= "0111000"; -- F
				WHEN OTHERS =>leds1<= "-------"; 
			END CASE;
		END PROCESS; --500831189
	END Behavior;