//===-HexagonSchedule.td - Hexagon Scheduling Definitions -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

// Functional Units
def LUNIT     : FuncUnit;
def LSUNIT    : FuncUnit;
def MUNIT     : FuncUnit;
def SUNIT     : FuncUnit;


// Itinerary classes
def ALU32     : InstrItinClass;
def ALU64     : InstrItinClass;
def CR        : InstrItinClass;
def J         : InstrItinClass;
def JR        : InstrItinClass;
def LD        : InstrItinClass;
def M         : InstrItinClass;
def ST        : InstrItinClass;
def S         : InstrItinClass;
def PSEUDO    : InstrItinClass;


def HexagonItineraries :
 ProcessorItineraries<[LUNIT, LSUNIT, MUNIT, SUNIT], [], [
  InstrItinData<ALU32      , [InstrStage<1,  [LUNIT, LSUNIT, MUNIT, SUNIT]>]>,
  InstrItinData<ALU64      , [InstrStage<1,  [MUNIT, SUNIT]>]>,
  InstrItinData<CR         , [InstrStage<1,  [SUNIT]>]>,
  InstrItinData<J          , [InstrStage<1,  [SUNIT, MUNIT]>]>,
  InstrItinData<JR         , [InstrStage<1,  [MUNIT]>]>,
  InstrItinData<LD         , [InstrStage<1,  [LUNIT, LSUNIT]>]>,
  InstrItinData<M          , [InstrStage<1,  [MUNIT, SUNIT]>]>,
  InstrItinData<ST         , [InstrStage<1,  [LSUNIT]>]>,
  InstrItinData<S          , [InstrStage<1,  [SUNIT, MUNIT]>]>,
  InstrItinData<PSEUDO     , [InstrStage<1,  [LUNIT, LSUNIT, MUNIT, SUNIT]>]>
]>;


//===----------------------------------------------------------------------===//
// V4 Machine Info +
//===----------------------------------------------------------------------===//

include "HexagonScheduleV4.td"

//===----------------------------------------------------------------------===//
// V4 Machine Info -
//===----------------------------------------------------------------------===//
