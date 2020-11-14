From mathcomp Require Import all_ssreflect.

Section IGStatus.

  Definition uint8 := nat.
  Variables IGSignal IGVoltage PreIGStatus : uint8.

  Definition IGVoltage_ON := 307.
  Definition IGVoltage_OFF := 204.
  Definition ON := 1.
  Definition OFF := 0.
  
  Check IGSignal == ON.
  Check IGVoltage >= IGVoltage_ON.
  
  Definition IGStatus :=
    if (IGSignal == ON) && (IGVoltage >= IGVoltage_ON) then ON
    else if (IGSignal == OFF) && (IGVoltage < IGVoltage_OFF) then OFF
         else PreIGStatus.
    
  Goal IGSignal = ON -> IGVoltage >= IGVoltage_ON -> IGStatus = ON.
    move=> Hsig Hvol.
    by rewrite /IGStatus Hsig Hvol //=.
  Qed.

  Goal IGSignal = OFF -> IGVoltage < IGVoltage_OFF-> IGStatus = OFF.
    move=> Hsig Hvol.
    by rewrite /IGStatus Hsig Hvol //=.
  Qed.

End IGStatus.
