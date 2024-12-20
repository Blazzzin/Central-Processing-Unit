--State Machine 9

library ieee;
use ieee.std_logic_1164.all;
entity fsm is
	port
	(
		clk				: in std_logic;
		data_in			: in std_logic;
		reset				: in std_logic;
		student_id		: out std_logic_vector (3 downto 0);
		current_state	: out std_logic_vector (3 downto 0));
		
end entity;

	Architecture fsm OF fsm IS
	
		type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
		signal yfsm : state_type;
		
	Begin
	
		process (clk, reset, data_in)
		begin
		
			if reset = '1' then
				yfsm <= s0;
				
			elsif (clk 'EVENT and clk = '1') then
				
				case yfsm is
				
					when s0 =>
					
						if data_in = '1' then
							yfsm <= s1;
						else
							yfsm <= s0;
						end if;
							
					when s1 =>
					
						if data_in = '1' then
							yfsm <= s2;
						else
							yfsm <= s1;
						end if;
						
					when s2 =>
					
						if data_in = '1' then
							yfsm <= s3;
						else
							yfsm <= s2;
						end if;
							
					when s3 =>
						
						if data_in = '1' then
							yfsm <= s4;
						else
							yfsm <= s3;
						end if;
					
					when s4 =>
					
						if data_in = '1' then
							yfsm <= s5;
						else
							yfsm <= s4;
						end if;
					
					when s5 =>
					
						if data_in = '1' then
							yfsm <= s6;
						else
							yfsm <= s5;
						end if;
					
					when s6 =>
					
						if data_in = '1' then
							yfsm <= s7;
						else 
							yfsm <= s6;
						end if;
					
					when s7 =>
					
						if data_in = '1' then
							yfsm <= s8;
						else
							yfsm <= s7;
						end if;
					
					when s8 =>
					
						if data_in = '1' then
							yfsm <= s9;
						else
							yfsm <= s8;
						end if;
					
					when s9 =>
					
						if data_in = '1' then
							yfsm <= s10;
						else
							yfsm <= s9;
						end if;
					
					when s10 =>
					
						if data_in = '1' then
							yfsm <= s0;
						else
							yfsm <= s10;
						end if;
					
				end case;
			end if;
		end process;
		
		process (yfsm)
		begin
			case yfsm is --501170211
				when s2 => --5
					student_id <= "0101";
				when s3 => --0
					student_id <= "0000"; 
				when s4 => --1
					student_id <= "0001";
				when s5 => --1
					student_id <= "0001";
				when s6 => --7
					student_id <= "0111";
				when s7 => --0
					student_id <= "0000";
				when s8 => --2
					student_id <= "0010";
				when s9 => --1
					student_id <= "0001";
				when s10 => --1
					student_id <= "0001";
				when others =>
					student_id <= "0000";
			end case;
		end process;
		
	process(yfsm)
	begin 
	case yfsm is
				when s0 =>
					 current_state <= "1011"; --dont care
				when s1 =>
					 current_state <= "1111"; --dont care
            when s2 =>
                current_state <= "0000"; --0
            when s3 =>
                current_state <= "0001"; --1
            when s4 =>
                current_state <= "0010"; --2
            when s5 =>
                current_state <= "0011"; --3
            when s6 =>
                current_state <= "0100"; --4
            when s7 =>
                current_state <= "0101"; --5
            when s8 =>
                current_state <= "0110"; --6
            when s9 =>
                current_state <= "0111"; --7
            when s10 =>
                current_state <= "1000"; --8   
        end case;
    end process;
end fsm;