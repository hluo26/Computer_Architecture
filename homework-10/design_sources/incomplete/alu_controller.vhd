LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY ALU_controller IS
   PORT( 
      ALU_op      : IN     std_logic_vector (1 DOWNTO 0);
      funct       : IN     std_logic_vector (5 DOWNTO 0);
      ALU_control : OUT    std_logic_vector (3 DOWNTO 0)
   );
END ALU_controller ;


ARCHITECTURE struct OF ALU_controller IS

BEGIN

-- Insert your code here --
process1 : process(ALU_op,funct)
BEGIN
    CASE ALU_op is
        when "00"=>
            ALU_control <= "0010";
            
        when "01"=>
            ALU_control <= "0110";
            
        when "10"=>
            case funct is
                when "100000" =>
                    ALU_control <= "0010";
                when "100010" =>
                    ALU_control <= "0110";
                when "100100" =>
                    ALU_control <= "0000";
                when "100101" =>
                    ALU_control <= "0001";
                when "101010" =>
                    ALU_control <= "0111";
                when others =>
                    ALU_control <= "1111";
             end case;
         when others =>
                ALU_control <= "1111";
         end case;
end process process1;
---------------------------

END struct;
