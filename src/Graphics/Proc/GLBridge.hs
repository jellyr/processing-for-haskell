module Graphics.Proc.GLBridge(
	MouseButton(..), Modifiers(..), Key(..), KeyState(..),
	Col(..),
	setupWindow
) where

import Graphics.Rendering.OpenGL hiding (scale, translate, rotate, rect, height, width)
import qualified Graphics.Rendering.OpenGL as G
import Graphics.UI.GLUT hiding (scale, translate, rotate, rect, rgba)

import Control.Monad.IO.Class
import GHC.Float

data Col = Col Float Float Float Float
    deriving (Show)


-----------------------------------------
-- init window

setupWindow :: IO ()
setupWindow = do
  getArgsAndInitialize  
  initialDisplayMode $= [DoubleBuffered]    
  createWindow ""
  multisample $= Enabled
  blend $= Enabled
  blendFunc $= (SrcAlpha, OneMinusSrcAlpha)
  size (100, 100)

size :: MonadIO m => (Float, Float) -> m ()
size p@(w, h) = liftIO $ do
  windowSize $= fromPoint p
  projection2 0 w h 0
  where
    fromPoint (x, y) = Size (f x) (f y)
    f = toEnum . floor

projection2 xl xu yl yu = do
  matrixMode $= Projection
  loadIdentity
  ortho (f2d xl) (f2d xu) (f2d yl) (f2d yu) zl zu 
  matrixMode $= Modelview 0
  where
    zl = -5
    zu = 5

--------------------------------------------
-- converters

f2d = float2Double     
