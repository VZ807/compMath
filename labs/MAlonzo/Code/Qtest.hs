{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Qtest where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- test.ℕ
d_ℕ_2 = ()
data T_ℕ_2 = C_zero_4 | C_suc_6 T_ℕ_2
-- test._+_
d__'43'__8 :: T_ℕ_2 -> T_ℕ_2 -> T_ℕ_2
d__'43'__8 v0 v1
  = case coe v0 of
      C_zero_4 -> coe v1
      C_suc_6 v2 -> coe C_suc_6 (coe d__'43'__8 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
