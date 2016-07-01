module Graphics.Proc.Core.State.Elements.Draw(
    DrawState(..),
    EllipseMode, RectMode, DrawMode(..), 
    StrokeCap(..), StrokeJoin(..)
) where

import Data.Default
import Graphics.Proc.Core.GLBridge

data DrawState = DrawState 
  { drawEllipseMode   :: EllipseMode
  , drawRectMode      :: RectMode
  , drawStrokeCap     :: StrokeCap
  , drawStrokeJoin    :: StrokeJoin
  , drawStrokeWeight  :: Float
  , drawFill          :: Col
  , drawStroke        :: Col  
  }

instance Default DrawState where
  def = DrawState 
    { drawEllipseMode  = Center
    , drawRectMode     = Corner
    , drawStrokeCap    = Round
    , drawStrokeJoin   = JoinMiter
    , drawStrokeWeight = 1
    , drawFill         = Col 1 1 1 1
    , drawStroke       = Col 1 1 1 1
    }

type EllipseMode = DrawMode
type RectMode = DrawMode

data DrawMode = Radius | Center | Corner | Corners
  deriving (Show, Eq, Enum, Bounded)

instance Default DrawMode where
  def = Center

data StrokeCap = Round | Square | Project
  deriving (Show, Eq, Enum, Bounded)

instance Default StrokeCap where
  def = Round

data StrokeJoin = JoinMiter | JoinBevel | JoinRound
  deriving (Show, Eq, Enum, Bounded)

instance Default StrokeJoin where  
  def = JoinMiter
