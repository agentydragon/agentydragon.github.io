--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative ((<$>))
import Data.Monoid (mappend)
import Hakyll

config :: Configuration
config = defaultConfiguration {
  deployCommand = "rsync -avz -e ssh ./_site/ rny.cz:/srv/http/rny.cz/default"
}

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
  match ("images/*" .||. "static/*") $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "CNAME" $ do
    route idRoute
    compile copyFileCompiler

  match "about.markdown" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  match "wiki/*" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" postCtx
      >>= relativizeUrls

  match "posts/*" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= saveSnapshot "content"
      >>= loadAndApplyTemplate "templates/post.html" postCtx
      >>= loadAndApplyTemplate "templates/default.html" postCtx
      >>= relativizeUrls

  create ["archive.html"] $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      let
        archiveCtx = listField "posts" postCtx (return posts) `mappend`
                     constField "title" "Archive" `mappend`
                     defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
        >>= loadAndApplyTemplate "templates/default.html" archiveCtx
        >>= relativizeUrls

  match "index.html" $ do
    route idRoute
    compile $ do
      posts <- ((take 10 <$>) . recentFirst) =<< loadAllSnapshots "posts/*" "content"
      let
        indexCtx = listField "posts" postCtx (return posts) `mappend`
                   constField "title" "Home" `mappend`
                   defaultContext

      getResourceBody >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx = dateField "date" "%Y-%m-%d" `mappend` defaultContext
