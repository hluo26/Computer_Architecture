LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY ALU IS
   PORT( 
      A           : IN     std_logic_vector (31 DOWNTO 0);
      ALU_control : IN     std_logic_vector (3 DOWNTO 0);
      B           : IN     std_logic_vector (31 DOWNTO 0);
      ALU_result  : OUT    std_logic_vector (31 DOWNTO 0);
      zero        : OUT    std_logic;
      overflow    : OUT    std_logic
   );
END ALU ;


ARCHITECTURE behav OF ALU IS

   -- Architecture declarations
   CONSTANT zero_value : std_logic_vector(31 downto 0) := (others => '0');

   -- Internal signal declarations
   SIGNAL ALU_result_internal : std_logic_vector(31 DOWNTO 0);
   SIGNAL s_A, s_B, s_C : std_logic;

BEGIN

   -- insert your design here --
    ALU: process(ALU_control,A,B,ALU_result_internal,s_A, s_B, s_C)
    begin
        overflow <= '0';
        case ALU_control is
            when "0000"     => 
                                ALU_result_internal <= A and B;
            when "0001"     => 
                                ALU_result_internal <= A or B;
            when "0010"     =>  
                                ALU_result_internal <= A + B;
                                overflow <= ((s_A) and (s_B) and (not s_C)) or ((not s_A) and (not s_B) and (s_C));
            when "0110"     => 
                                ALU_result_internal <= A - B;
                                overflow <= ((s_A) and (not s_B) and (not s_C)) or ((not s_A) and (s_B) and (s_C));
            when "0111"     => 
                                if(A<B) then
                                    ALU_result_internal<="00000000000000000000000000000001";
                                else
                                    ALU_result_internal<="00000000000000000000000000000000";
                                end if;
            when"1100"      => 
                                ALU_result_internal <= A nor B;
            when others     => 
                                ALU_result_internal <= "00000000000000000000000000000000";
            end case;
            if ALU_result_internal /= zero_value then
                zero <= '0';
            else
                zero <= '1';
            end if;
            
    end process ALU;
   -----------------------------   
    ALU_result <= ALU_result_internal;
    s_A <= A(31);
    s_B <= B(31);
    s_C <= ALU_result_internal(31);
END behav;
