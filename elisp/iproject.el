<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: iproject.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=iproject.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: iproject.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=iproject.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for iproject.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=iproject.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><br /><span class="specialdays">Moldova, National Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22iproject%5c.el%22">iproject.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/iproject.el">Download</a></p><pre><span class="comment">;;; iproject.el --- Interactive Project Mode</span>
<span class="comment">;;</span>
<span class="comment">;; Author:      Cedric Lallain &lt;kandjar76@hotmail.com&gt;</span>
<span class="comment">;; Version:     1.0</span>
<span class="comment">;; Keywords:    interactive project buffer makefile filesystem management</span>
<span class="comment">;; Description: Interactive Project Extension For Project-Buffer-Mode</span>
<span class="comment">;; Tested with: GNU Emacs 22.x and GNU Emacs 23.x</span>
<span class="comment">;;</span>
<span class="comment">;; This file is *NOT* part of GNU Emacs.</span>
<span class="comment">;;</span>
<span class="comment">;;    This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;;    it under the terms of the GNU General Public License as published by</span>
<span class="comment">;;    the Free Software Foundation; either version 2 of the License, or</span>
<span class="comment">;;    (at your option) any later version.</span>
<span class="comment">;;</span>
<span class="comment">;;    This program is distributed in the hope that it will be useful,</span>
<span class="comment">;;    but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;;    GNU General Public License for more details.</span>
<span class="comment">;;</span>
<span class="comment">;;    You should have received a copy of the GNU General Public License</span>
<span class="comment">;;    along with this program; if not, write to the Free Software</span>
<span class="comment">;;    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.</span>
<span class="comment">;;</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>
<span class="comment">;;</span>

<span class="comment">;; This is an add-on library for project-buffer-mode.</span>
<span class="comment">;;</span>
<span class="comment">;; iproject stands for Interactive Project; based on the</span>
<span class="comment">;; project-buffer-mode; it provides an interactive way to create</span>
<span class="comment">;; projects.</span>
<span class="comment">;;</span>
<span class="comment">;; Simply creates a new project using `<span class="constant important">iproject-new</span>' (C-x p n); then</span>
<span class="comment">;; add new projects using `<span class="constant important">iproject-add-project</span>' (C-c n).</span>
<span class="comment">;;</span>
<span class="comment">;; Once the project is created it is possible to add extra files to</span>
<span class="comment">;; the current project using `<span class="constant important">iproject-add-files-to-current-project</span>'</span>
<span class="comment">;; (C-c +).</span>
<span class="comment">;;</span>
<span class="comment">;; iproject will ask the user for command lines (with default values</span>
<span class="comment">;; based on the selected project type) to run each user action which</span>
<span class="comment">;; are: build/clean/run/debug and update.  These command lines will be</span>
<span class="comment">;; stored in the project but also saved with the project.</span>
<span class="comment">;;</span>
<span class="comment">;; HOW TO INSTALL IT<span class="builtin">:</span></span>
<span class="comment">;; </span>
<span class="comment">;; Just add to your .emacs<span class="builtin">:</span></span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">iproject</span>)</span>
<span class="comment">;;   (iproject-key-binding)</span>
<span class="comment">;;</span>
<span class="comment">;; KEY BINDINGS IN THE IPROJECT BUFFER<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; C-c n   to add new project</span>
<span class="comment">;; C-c +   to add file to an existing project</span>
<span class="comment">;; C-c C-r to revert the project</span>
<span class="comment">;; C-x C-w to write the project</span>
<span class="comment">;; C-x C-s to save the project</span>
<span class="comment">;;</span>
<span class="comment">;; as well as all standard project-buffer-mode key-bindings.</span>
<span class="comment">;;</span>
<span class="comment">;; GLOBAL KEY BINDINGS<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; C-x p n to create a new iproject</span>
<span class="comment">;; C-x p f to load a project file</span>
<span class="comment">;;</span>


<span class="comment">;;; History<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; v1.0: First official release.</span>
<span class="comment">;;</span>


(<span class="keyword">require</span> '<span class="constant">project-buffer-mode</span>)


<span class="comment">;;; Code<span class="builtin">:</span></span>


<span class="comment">;;</span>
<span class="comment">;;  Global configuration variable<span class="builtin">:</span></span>
<span class="comment">;;</span>

(<span class="keyword">defvar</span> <span class="variable">iproject-filters</span>
  '((c++       (<span class="string">"\\.[cChH][pPxX+][pPxX+]$"</span> <span class="string">"\\.[cChH]$"</span> <span class="string">"\\.[iI][nN][lL]$"</span> <span class="string">"\\.[cC][cC]$"</span>))
    (c         (<span class="string">"\\.[cChH]$"</span> <span class="string">"\\.[iI][nN][lL]$"</span> <span class="string">"\\.[cC][cC]$"</span>))
    (elisp     (<span class="string">"\\.el$"</span>))
    (perl      (<span class="string">"\\.pl$"</span>))
    (ruby      (<span class="string">"\\.rb$"</span>))
    (sharp     (<span class="string">"\\.[cjf]s$"</span>))
    (python    (<span class="string">"\\.py$"</span>))
    (smalltalk (<span class="string">"\\.st$"</span>))
    (haskell   (<span class="string">"\\.hs$"</span>))
    (ocaml     (<span class="string">"\\.ml$"</span>))
    (lisp      (<span class="string">"\\.cl$"</span>))
    (awk       (<span class="string">"\\.awk$"</span>))
    (java      (<span class="string">"\\.java$"</span> <span class="string">"\\.js$"</span>))
    (cg        (<span class="string">"\\.cg\\(?<span class="builtin">:fx</span>\\)?$"</span>))
    (web       (<span class="string">"\\.htm\\(?<span class="builtin">:l</span>\\)?$"</span> <span class="string">"\\.xml"</span> <span class="string">"\\.php$"</span> <span class="string">"\\.js$"</span> <span class="string">"\\.css$"</span>))
    (custom    (nil)))
  <span class="string">"List of the different file filters."</span>
)

(<span class="keyword">defvar</span> <span class="variable">iproject-project-type</span>
  '((makefile (<span class="string">"\\.mak$"</span> <span class="string">"Makefile$"</span>)
	      ((build . <span class="string">"make -C {root} CONFIG={build}"</span>)
	       (clean . <span class="string">"make -C {root} clean CONFIG={build}"</span>)))
    (cmake    (<span class="string">"CMakeLists.txt"</span>)
	      ((build . <span class="string">"make -C {root} CONFIG={build}"</span>)
	       (clean . <span class="string">"make -C {root} clean CONFIG={build}"</span>)))
    (jam      (<span class="string">"Jamfile\\(?<span class="builtin">:s</span>\\)?$"</span> <span class="string">"Jamrules$"</span> <span class="string">"Jambase$"</span> <span class="string">"Jamroot$"</span>)
	      ((build . <span class="string">"jam -a {project}"</span>)
	       (clean . <span class="string">"jam clean -a {project}"</span>)))
    (scons    (<span class="string">"SConstruct$"</span> <span class="string">"Sconscript$"</span>)
	      ((build . <span class="string">"scons"</span>)
	       (clean . <span class="string">"scons --clean"</span>)))
    (dmconfig (<span class="string">"build.dmc$"</span>)
	      ((build . <span class="string">"make {platform}.{project}-{build}.build"</span>)
	       (clean . <span class="string">"make {platform}.{project}-{build}.clean"</span>)
	       (run . <span class="string">"make {platform}.{project}-{build}.run"</span>)
	       (debug . <span class="string">"make {platform}.{project}-{build}.debug"</span>)))
    (cabal    (<span class="string">"\\.cabal$"</span>)
	      ((build . <span class="string">"cabal build"</span>)
	       (clean . <span class="string">"cabal clean"</span>)))
    (any      (<span class="string">".*$"</span>)
	      ((build . <span class="string">""</span>)))
    (blank    nil
	      ((build . <span class="string">""</span>))))
  <span class="string">"List of the different project type.

Each project type is a list of the following format:
  (symbol matching-regexp (action-string-list)) where
  action-string-list is a set of 4 strings representing the default
  command to 'build' 'clean' 'run' and 'debug'.
  the following wild cards can be use in each action string:
   {build}    the current selected build version
   {platform} the current selected platform
   {project}  name of the project
   {projfile} path of the project's main file
   {root}     root folder of the project"</span>
)

(<span class="keyword">defvar</span> <span class="variable">iproject-ignore-folder</span>
  '(<span class="string">".git"</span> <span class="string">".svn"</span> <span class="string">"bzr"</span> <span class="string">".hg"</span> <span class="string">"CVS"</span> <span class="string">".CVS"</span> <span class="string">"build"</span> <span class="string">"lib"</span> <span class="string">"Debug"</span> <span class="string">"Release"</span>)
  <span class="string">"List of folder to ignore during the recursive search."</span>)


<span class="comment">;;</span>
<span class="comment">;; History<span class="builtin">:</span></span>
<span class="comment">;;</span>


(<span class="keyword">defvar</span> <span class="variable">iproject-project-type-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-file-filter-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-file-filter-query-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-file-filter-regexp-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-file-filter-extension-list-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-project-name-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-platforms-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-build-configurations-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-action-commands-history</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-base-directory-history</span> nil)


<span class="comment">;;</span>
<span class="comment">;;  Local variables<span class="builtin">:</span></span>
<span class="comment">;;</span>

(<span class="keyword">defvar</span> <span class="variable">iproject-last-project-type-choosen</span> <span class="string">"makefile"</span>)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-filter-type-choosen</span> <span class="string">"c++"</span>)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-file-filter-query-mode-choosen</span> <span class="string">"regexp"</span>)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-file-filter-regexp-choosen</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-file-extension-list-choosen</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-platform-list</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-build-configuration-list</span> nil)
(<span class="keyword">defvar</span> <span class="variable">iproject-last-base-directory-choosen</span> nil)


<span class="comment">;;</span>
<span class="comment">;;  Functions<span class="builtin">:</span></span>
<span class="comment">;;</span>

(<span class="keyword">defun</span> <span class="function">iproject-choose-project-type</span>()
  <span class="string">"Request and return the selected project type"</span>
  (<span class="keyword elisp">let</span>* ((project-type-string (completing-read (format <span class="string">"Project Type [default %s]: "</span> iproject-last-project-type-choosen)
					       iproject-project-type nil t nil 'iproject-project-type-history iproject-last-project-type-choosen))
	 (project-type (intern project-type-string)))
    (setq iproject-last-project-type-choosen project-type-string)
    (assoc project-type iproject-project-type)))

(<span class="keyword">defun</span> <span class="function">iproject-shorten-string</span>(str max-lgt)
  <span class="string">"If the length of STR is greater than MAX-LGT<span class="comment">; shorten the string adding '...' at the end."</span></span>
  (<span class="keyword elisp">if</span> (&gt; (length str) max-lgt)
      (concat (substring str 0 (- max-lgt 3)) <span class="string">"..."</span>)
      str))

(<span class="keyword">defun</span> <span class="function">iproject-choose-file-filter</span>()
  <span class="string">"Read the file filter."</span>
  (<span class="keyword elisp">let</span>* ((filter-type-string (completing-read (format <span class="string">"Filter Type [default %s]: "</span> iproject-last-filter-type-choosen)
					       iproject-filters nil t nil 'iproject-file-filter-history iproject-last-filter-type-choosen))
	 (filter-type (intern filter-type-string)))
    (setq iproject-last-filter-type-choosen filter-type-string)
    (<span class="keyword elisp">if</span> (not (eq filter-type 'custom))
	<span class="comment">;; If not custom: return the selected file-filter<span class="builtin">:</span></span>
	(assoc filter-type iproject-filters)
	<span class="comment">;; In case of custom file filter<span class="builtin">:</span></span>
	<span class="comment">;; Let's first ask how to specify the filter<span class="builtin">:</span></span>
	(<span class="keyword elisp">let</span>* ((query-mode-string (completing-read (format <span class="string">"Enter the file system query mode (regexp, file-extension) [default %s]: "</span> iproject-last-file-filter-query-mode-choosen)
						   '(<span class="string">"regexp"</span> <span class="string">"file-extension"</span>) nil t nil 'iproject-file-filter-query-history iproject-last-file-filter-query-mode-choosen))
	       (query-mode (intern query-mode-string)))
	  (setq iproject-last-file-filter-query-mode-choosen query-mode-string)
	  (<span class="keyword elisp">cond</span> ((eq query-mode 'regexp)
		 <span class="comment">;; A regexp<span class="builtin">:</span></span>
		 (<span class="keyword elisp">let</span>* ((def-string (<span class="keyword elisp">if</span> iproject-last-file-filter-regexp-choosen
					(concat <span class="string">" [default "</span> (iproject-shorten-string iproject-last-file-filter-regexp-choosen 9) <span class="string">"]"</span>)
					<span class="string">""</span>))
			(file-filter-regexp (read-from-minibuffer (format <span class="string">"Enter the file filter regexp%s: "</span> def-string)
								  nil nil nil 'iproject-file-filter-regexp-history)))
		   (<span class="keyword elisp">if</span> (= (length file-filter-regexp) 0)
		       (setq file-filter-regexp iproject-last-file-filter-regexp-choosen)
		       (setq iproject-last-file-filter-regexp-choosen file-filter-regexp))
		   (list 'custom (list file-filter-regexp))))
		((eq query-mode 'file-extension)
		 <span class="comment">;; A list of file extension<span class="builtin">:</span></span>
		 (<span class="keyword elisp">let</span>* ((def-string (<span class="keyword elisp">if</span> iproject-last-file-extension-list-choosen
					(concat <span class="string">" [default "</span> (iproject-shorten-string iproject-last-file-extension-list-choosen 9) <span class="string">"]"</span>)
					<span class="string">""</span>))
			(file-extension-list (read-from-minibuffer (format <span class="string">"Enter the list of extension separated by spaces%s: "</span> def-string)
								   nil nil nil 'iproject-file-filter-extension-list-history)))
		   (<span class="keyword elisp">if</span> (= (length file-extension-list) 0)
		       (setq file-extension-list iproject-last-file-extension-list-choosen)
		       (setq iproject-last-file-extension-list-choosen file-extension-list))
		   (list 'custom (list (concat <span class="string">"\\."</span> (regexp-opt (split-string file-extension-list)) <span class="string">"$"</span>)))))
		(t (<span class="warning">error</span> <span class="string">"Unknown Query Mode"</span>)))))))


(<span class="keyword">defun</span> <span class="function">iproject-collect-files</span>(root-folder file-filter-list <span class="type">&amp;optional</span> ignore-folders)
  <span class="string">"Parse ROOT-FOLDER and its sub-folder and create a list of full path filename matching one of the regexp of FILE-FILTER-LIST.
The folder defined inside in IGNORE-FOLDERS will be skipped."</span>
  (<span class="keyword elisp">let</span> ((dir-list (directory-files-and-attributes root-folder t))
	(ign-reg  (concat (regexp-opt ignore-folders) <span class="string">"$"</span>))
	file-list)
    (<span class="keyword elisp">while</span> dir-list
      (<span class="keyword elisp">let</span>* ((cur-node (pop dir-list))
	     (fullpath (car cur-node))
	     (is-dir   (eq (car (cdr cur-node)) t))
	     (is-file  (not (car (cdr cur-node))))
	     (basename (file-name-nondirectory fullpath)))
	(<span class="keyword elisp">cond</span>
	 <span class="comment">;; if the current node is a directory different from <span class="string">"."</span> or <span class="string">".."</span>, all it's file gets added to the list</span>
	 ((and is-dir
	       (not (string-equal basename <span class="string">"."</span>))
	       (not (string-equal basename <span class="string">".."</span>))
	       (or (not ignore-folders)
		   (not (string-match ign-reg basename))))
	       (setq dir-list (append dir-list (directory-files-and-attributes fullpath t))))
	 <span class="comment">;; if the current node is a file</span>
	 (is-file
	  <span class="comment">;; check against the file filter, if it succeed: add the file to the file-list</span>
	  (<span class="keyword cl">when</span> (some '(<span class="keyword elisp">lambda</span> (item) (string-match item basename)) file-filter-list)
	    (setq file-list (cons fullpath file-list)))
	  ))))
    file-list))


(<span class="keyword">defun</span> <span class="function">iproject-generate-user-data</span>(action-string-list
				     project-name
				     project-main-file
				     project-root-folder)
  <span class="string">"Generate the project's user data based from ACTION-STRING-LIST.
ACTION-STRING-LIST is a list of string<span class="comment">; each of them corresponding to the project actions.</span>
This function returns a assoc-list of assoc-list such as:
  (cdr (assoc buildconfig (cdr (assoc platform data)))) should returns a list of user actions.

In each action string list may contain the following wildcard
which will be replaced by their respective value:
   {build}    the current selected build version
   {platform} the current selected platform
   {project}  name of the project
   {projfile} path of the project's main file
   {root}     root folder of the project"</span>

  (<span class="keyword elisp">let</span> ((platform-list iproject-platform-list)
	user-data)
    (<span class="keyword elisp">while</span> platform-list
      (<span class="keyword elisp">let</span> ((current-platform (pop platform-list))
	    (build-config-list iproject-build-configuration-list)
	    bc-list)
	(setq user-data (cons (cons current-platform
				    (<span class="keyword elisp">progn</span> (<span class="keyword elisp">while</span> build-config-list
					     (<span class="keyword elisp">let</span> ((current-build-config (pop build-config-list)))
					       (setq bc-list (cons (cons current-build-config
									 (mapcar (<span class="keyword elisp">lambda</span> (action-node)
										   (<span class="keyword elisp">let</span>* ((action-string (cdr action-node))
											  (repl1 (replace-regexp-in-string <span class="string">"{build}"</span>    current-build-config  action-string))
											  (repl2 (replace-regexp-in-string <span class="string">"{platform}"</span> current-platform      repl1))
											  (repl3 (replace-regexp-in-string <span class="string">"{project}"</span>  project-name          repl2))
											  (repl4 (replace-regexp-in-string <span class="string">"{projfile}"</span> project-main-file     repl3))
											  (repl5 (replace-regexp-in-string <span class="string">"{root}"</span>     project-root-folder   repl4)))
										     (cons (car action-node) repl5)))
										 action-string-list))
								   bc-list))
					       ))
					   bc-list)
				      )
			      user-data))))
    user-data))


(<span class="keyword">defun</span> <span class="function">iproject-action-handler</span>(action project-name project-path platform configuration)
  (<span class="keyword elisp">let</span>* ((user-data (project-buffer-get-project-user-data project-name))
	 (query-string (concat (upcase-initials (format <span class="string">"%s"</span> action)) <span class="string">" command: "</span>))
	 user-command)
    <span class="comment">;; user data's format is: '((platform1 (config1 . ((action1 . <span class="string">"cmd"</span>) (action2 . <span class="string">"cmd"</span>))) (config2 ...)) (platform2...))</span>
    <span class="comment">;; platform-data:         '(curplat (config1 . ((act...))) (config2 ...))</span>
    <span class="comment">;; config-data:           '(config1 (act1 ...) (act2...))</span>
    <span class="comment">;; action-data:           '(action . <span class="string">"cmd"</span>)</span>
    (<span class="keyword elisp">if</span> user-data
      (<span class="keyword elisp">let</span> ((platform-data (assoc platform user-data)))
	(<span class="keyword elisp">if</span> platform-data
	    (<span class="keyword elisp">let</span> ((config-data (assoc configuration (cdr platform-data))))
	      (<span class="keyword elisp">if</span> config-data
		  (<span class="keyword elisp">let</span> ((action-data (assoc action (cdr config-data))))
		    (<span class="keyword elisp">if</span> action-data
			(<span class="keyword elisp">progn</span> (setq user-command (read-from-minibuffer query-string (cdr action-data) nil nil 'iproject-action-commands-history))
			       (setcdr action-data user-command))
			(<span class="keyword elisp">progn</span> (setq user-command (read-from-minibuffer query-string nil nil nil 'iproject-action-commands-history))
			       (setcdr config-data (acons action user-command (cdr config-data))))))
		  (<span class="keyword elisp">progn</span> (setq user-command (read-from-minibuffer query-string nil nil nil 'iproject-action-commands-history))
			 (setcdr platform-data (acons configuration (acons action user-command nil) (cdr platform-data))))))
	    (<span class="keyword elisp">progn</span> (setq user-command (read-from-minibuffer query-string nil nil nil 'iproject-action-commands-history))
		   (setcdr user-data (copy-alist user-data))
		   (setcar user-data (cons platform (acons configuration (acons action user-command nil) nil))))))
      (<span class="keyword elisp">progn</span> (setq user-command (read-from-minibuffer query-string nil nil nil 'iproject-action-commands-history))
	     (project-buffer-set-project-user-data project-name (acons platform (acons configuration (acons action user-command nil) nil) nil))))
    (compile user-command)))


<span class="comment">;;</span>
<span class="comment">;;  User command<span class="builtin">:</span></span>
<span class="comment">;;</span>


(<span class="keyword">defun</span> <span class="function">iproject-add-project</span>(<span class="type">&amp;optional</span> project-type project-main-file project-root-folder project-name file-filter)
  <span class="string">"Select a FOLDER, a MAIN-FILE and a FILE-FILTER, then add all
files under the current folder and sub-folder matching the
FILE-FILTER will be added to the project."</span>
  (interactive)
  (<span class="keyword cl">unless</span> project-buffer-status (<span class="warning">error</span> <span class="string">"Not in project-buffer buffer"</span>))
  (<span class="keyword cl">when</span> (interactive-p)
    <span class="comment">;; Read the project-type</span>
    (<span class="keyword cl">unless</span> project-type
      (setq project-type (iproject-choose-project-type)))
    <span class="comment">;; Read the project-main-file (<span class="keyword elisp">if</span> the project's type is 'blank' there is no root filename)</span>
    (<span class="keyword cl">unless</span> project-main-file
      (<span class="keyword cl">when</span> (nth 1 project-type)
	(<span class="keyword elisp">let</span>* ((project-filter (nth 1 project-type))
	       (project-predicate (<span class="keyword elisp">lambda</span> (filename)
				    (and (not (string-equal filename <span class="string">"./"</span>))
					 (not (string-equal filename <span class="string">"../"</span>))
					 (or (file-directory-p filename)
					     (some '(<span class="keyword elisp">lambda</span> (item) (string-match item filename)) project-filter))))))
	  (<span class="keyword elisp">while</span> (or (not project-main-file)
		     (file-directory-p project-main-file)
		     (not (funcall project-predicate project-main-file)))
	    (<span class="keyword elisp">let</span> ((def-dir (and project-main-file (file-directory-p project-main-file) project-main-file)))
	      (setq project-main-file (read-file-name <span class="string">"Project Main File: "</span> def-dir nil t nil project-predicate))
	      )))))
    <span class="comment">;; Read the project-root-folder<span class="builtin">:</span></span>
    (<span class="keyword cl">unless</span> project-root-folder
      (<span class="keyword elisp">let</span> ((def-dir (<span class="keyword elisp">if</span> project-main-file
			 (file-name-directory project-main-file)
			 default-directory)))
	(<span class="keyword elisp">while</span> (or (not project-root-folder)
		   (= (length project-root-folder) 0))
	  (setq project-root-folder (read-directory-name <span class="string">"File Search - Root Folder: "</span> def-dir def-dir t)))
	(<span class="keyword cl">unless</span> (string-equal (substring project-root-folder -1) <span class="string">"/"</span>)
	  (setq project-root-folder (concat project-root-folder <span class="string">"/"</span>)))
	))
    <span class="comment">;; Read the project name<span class="builtin">:</span></span>
    (<span class="keyword cl">unless</span> project-name
      (<span class="keyword elisp">while</span> (not project-name)
	(setq project-name (read-from-minibuffer <span class="string">"Project Name: "</span>
						 (file-name-nondirectory (substring project-root-folder 0 -1))
						 nil nil 'iproject-project-name-history))
	(<span class="keyword cl">when</span> (project-buffer-project-exists-p project-name)
	  (message <span class="string">"Project %s already exists!"</span> project-name)
	  (sit-for 2)
	  (setq project-name nil))
	))
    <span class="comment">;; Read the file-filter<span class="builtin">:</span></span>
    (<span class="keyword cl">unless</span> file-filter
      (setq file-filter (iproject-choose-file-filter)))
    )

  (<span class="keyword elisp">let</span> (file-list user-data project-settings)
    <span class="comment">;;</span>
    <span class="comment">;; Collect the project's file</span>
    <span class="comment">;;</span>
    (setq file-list (iproject-collect-files project-root-folder (nth 1 file-filter) iproject-ignore-folder))

    <span class="comment">;;</span>
    <span class="comment">;; Populate the project-buffer-mode<span class="builtin">:</span></span>
    <span class="comment">;;</span>

    <span class="comment">;; Generate the project node's user-data<span class="builtin">:</span></span>
    (setq user-data (iproject-generate-user-data (nth 2 project-type)
						   project-name
						   project-main-file
						   project-root-folder))

    <span class="comment">;; Create the initial project settings<span class="builtin">:</span></span>
    <span class="comment">;; project settings is a list of lists, each sub list should follow the following format<span class="builtin">:</span></span>
    <span class="comment">;;   (root-project-folder root-file-folder file-filter-list ignore-folder-list)</span>
    (setq project-settings (list (list <span class="string">""</span> project-root-folder (nth 1 file-filter) iproject-ignore-folder)))

    <span class="comment">;; Add the project node</span>
    (project-buffer-insert project-name 'project project-main-file project-name)
    (project-buffer-set-project-build-configurations project-name iproject-build-configuration-list)
    (project-buffer-set-project-platforms            project-name iproject-platform-list)
    (project-buffer-set-project-user-data            project-name user-data)
    (project-buffer-set-project-settings-data        project-name  project-settings)

    <span class="comment">;; Add each individual files to the project<span class="builtin">:</span></span>
    (mapcar (<span class="keyword elisp">lambda</span> (name)
	      (<span class="keyword elisp">let</span>* ((relative-path (file-relative-name name))
		     (full-path     (abbreviate-file-name name))
		     (file-name     (<span class="keyword elisp">if</span> (&gt; (length relative-path) (length full-path)) full-path relative-path))
		     (proj-name     (substring name (length (expand-file-name project-root-folder)) (length name))))
		(project-buffer-insert proj-name 'file  file-name project-name)))
	    file-list)
    <span class="comment">;; Add the project's main file to the project<span class="builtin">:</span></span>
    (<span class="keyword cl">when</span> project-main-file
      (project-buffer-insert (file-name-nondirectory project-main-file) 'file  project-main-file project-name))
  ))


(<span class="keyword">defun</span> <span class="function">iproject-uniquify-name</span>(file-name file-path project)
  <span class="string">"Returns a uniq name based on FILE-NAME to be inserted inside PROJECT.
Returns nil if the FILE-NAME is already in PROJECT."</span>
  (<span class="keyword elisp">let</span> (cur-name)
    <span class="comment">;; Check: if file-name ends with <span class="string">" (N)"</span> but not file-path; we'll remove it.</span>
    (<span class="keyword elisp">let</span> ((ndx (string-match <span class="string">" ([0-9]+)$"</span> file-name)))
      (<span class="keyword elisp">if</span> (and ndx (not (string-match <span class="string">" ([0-9]+)$"</span> file-path))) <span class="comment">;; I'm ignoring the fact the number may be different :)</span>
	  (setq cur-name (substring file-name 0 ndx))
	  (setq cur-name file-name)))
    <span class="comment">;; Check name conflict<span class="builtin">:</span></span>
    (<span class="keyword elisp">let</span> ((exists        (project-buffer-exists-p cur-name project))
	  (existing-path (project-buffer-get-file-path cur-name project))
	  (count 2))
      (<span class="keyword cl">when</span> exists
	(<span class="keyword elisp">if</span> (and existing-path (string-equal file-path existing-path))
	    (setq cur-name nil) <span class="comment">; if the file is already present, skip it (note: the search is very basic; it is possible to trick the system and add a file twice...)</span>
	    (setq cur-name (concat cur-name <span class="string">" (1)"</span>))))
      (<span class="keyword elisp">while</span> (and exists cur-name)
	(setq exists        (project-buffer-exists-p cur-name project))
	(setq existing-path (project-buffer-get-file-path cur-name project))
	(<span class="keyword cl">when</span> exists
	  (<span class="keyword elisp">if</span> (and existing-path (string-equal file-path existing-path))
	      (setq cur-name nil) <span class="comment">; if the file is already present, skip it</span>
	      (setq cur-name (concat (substring proj-name 0 -2) (format <span class="string">"%i)"</span> count))
		    count (1+ count)))))
      cur-name)))


(<span class="keyword">defun</span> <span class="function">iproject-add-file-list-to-current-project</span>(current-project base-virtual-folder root-folder file-list)
  <span class="string">"Add files contained in FILE-LIST in the CURRENT-PROJECT
prefixing the project's filename with BASE-VIRTUAL-FOLDER."</span>
  (mapcar (<span class="keyword elisp">lambda</span> (name)
	    (<span class="keyword elisp">let</span>* ((relative-path (file-relative-name name))
		   (full-path     (abbreviate-file-name name))
		   (file-name     (<span class="keyword elisp">if</span> (&gt; (length relative-path) (length full-path)) full-path relative-path))
		   (proj-name     (iproject-uniquify-name (concat base-virtual-folder (substring name (length (expand-file-name root-folder)) (length name)))
							  file-name current-project)))
		  (<span class="keyword cl">when</span> proj-name
		    (project-buffer-insert proj-name 'file  file-name current-project))))
	      file-list))


(<span class="keyword">defun</span> <span class="function">iproject-add-files-to-current-project</span>(<span class="type">&amp;optional</span> root-folder file-filter base-virtual-folder)
  <span class="string">"Add extra files to the current project."</span>
  (interactive)
  (<span class="keyword cl">unless</span> project-buffer-status (<span class="warning">error</span> <span class="string">"Not in project-buffer buffer"</span>))
  (<span class="keyword elisp">let</span> ((current-project (project-buffer-get-current-project-name)))
    (<span class="keyword cl">unless</span> current-project (<span class="warning">error</span> <span class="string">"No current project found"</span>))
    (<span class="keyword cl">when</span> (interactive-p)
      <span class="comment">;; Read the root-folder<span class="builtin">:</span></span>
      (<span class="keyword cl">unless</span> root-folder
	(<span class="keyword elisp">while</span> (or (not root-folder)
		   (= (length root-folder) 0))
	    (setq root-folder (read-directory-name <span class="string">"File Search - Root Folder: "</span> nil nil t)))
	(<span class="keyword cl">unless</span> (string-equal (substring root-folder -1) <span class="string">"/"</span>)
	  (setq root-folder (concat root-folder <span class="string">"/"</span>))))
      <span class="comment">;; Read the file-filter<span class="builtin">:</span></span>
      (<span class="keyword cl">unless</span> file-filter
	(setq file-filter (iproject-choose-file-filter)))
      <span class="comment">;; Read the base-virtual-path<span class="builtin">:</span></span>
      (<span class="keyword cl">unless</span> base-virtual-folder
	(<span class="keyword elisp">let</span>* ((def-string (<span class="keyword elisp">if</span> iproject-last-base-directory-choosen
			       (concat <span class="string">" [default "</span> (iproject-shorten-string iproject-last-base-directory-choosen 9) <span class="string">"]"</span>)
			       <span class="string">""</span>)))	       
	  (setq base-virtual-folder (read-from-minibuffer (format <span class="string">"Enter the base directory in the project%s: "</span> def-string)
							  nil nil nil 'iproject-last-base-directory-history))))
      )

    (<span class="keyword elisp">let</span> (file-list user-data project-settings)
      <span class="comment">;; Collect the project's file</span>
      (setq file-list (iproject-collect-files root-folder (nth 1 file-filter) iproject-ignore-folder))

      <span class="comment">;; Make sure the base-virtual-folder doesn't start with a '/' and end with one<span class="builtin">:</span></span>
      (<span class="keyword cl">when</span> (and (&gt; (length base-virtual-folder) 0)
		 (string-equal (substring base-virtual-folder 0 1) <span class="string">"/"</span>))
	(setq base-virtual-folder (substring base-virtual-folder 1)))
      (<span class="keyword cl">unless</span> (or (= (length base-virtual-folder) 0)
		  (string-equal (substring base-virtual-folder -1) <span class="string">"/"</span>))
	(setq base-virtual-folder (concat base-virtual-folder <span class="string">"/"</span>)))
      
      <span class="comment">;; Update the project settings<span class="builtin">:</span></span>
      (setq project-settings (cons (list base-virtual-folder root-folder (nth 1 file-filter) iproject-ignore-folder)
				   (project-buffer-get-project-settings-data current-project)))
      (project-buffer-set-project-settings-data current-project project-settings)
     
      <span class="comment">;; Add each individual files to the project<span class="builtin">:</span></span>
      (iproject-add-file-list-to-current-project current-project base-virtual-folder root-folder file-list)
      )))


(<span class="keyword">defun</span> <span class="function">iproject-move-files-within-project</span>(file-list folder-name)
  <span class="string">"Move the file present in FILE-LIST into the folder FOLDER-NAME.
FILE-LIST should be a list of list '(file-name file-path project)."</span>
  (<span class="keyword elisp">let</span> ((virtual-folder folder-name))
    <span class="comment">;; Make sure the folder name doesn't start with a '/' but ends with one.</span>
    (<span class="keyword cl">when</span> (and (&gt; (length virtual-folder) 0)
	       (string-equal (substring virtual-folder 0 1) <span class="string">"/"</span>))
      (setq virtual-folder (substring virtual-folder 1)))
    (<span class="keyword cl">unless</span> (or (= (length virtual-folder) 0)
		(string-equal (substring virtual-folder -1) <span class="string">"/"</span>))
      (setq virtual-folder (concat virtual-folder <span class="string">"/"</span>)))
    <span class="comment">;; Let's delete all files from the project<span class="builtin">:</span></span>
    (mapcar (<span class="keyword elisp">lambda</span> (file-node)
		(project-buffer-delete-file (car file-node) (nth 2 file-node) t))
	    file-list)
    <span class="comment">;; Re-add each node making sure they are uniq<span class="builtin">:</span></span>
    (mapcar (<span class="keyword elisp">lambda</span> (file-node)
	      (<span class="keyword elisp">let</span> ((file-name (nth 0 file-node))
		    (file-path (nth 1 file-node))
		    (project   (nth 2 file-node)))
		(setq file-name (iproject-uniquify-name (concat virtual-folder (file-name-nondirectory file-name))
							file-path project))
		(<span class="keyword cl">when</span> file-name
		  (project-buffer-insert file-name 'file file-path project))))
	    file-list)))
  
  
(<span class="keyword">defun</span> <span class="function">iproject-move-marked-files-or-current-file-within-project</span>(<span class="type">&amp;optional</span> folder-name)
  <span class="string">"Move the marked files into an specified project's folder."</span>
  (interactive)
  (<span class="keyword elisp">let</span>* ((node-list    (project-buffer-get-marked-node-list))
	 (current-node (<span class="keyword cl">unless</span> node-list (project-buffer-get-current-file-data))))
    (<span class="keyword cl">unless</span> (or node-list current-node) (<span class="warning">error</span> <span class="string">"No marked files / No current file found"</span>))
    (<span class="keyword cl">unless</span> folder-name
      (<span class="keyword elisp">let</span> ((def-string (<span class="keyword elisp">if</span> iproject-last-base-directory-choosen
			    (concat <span class="string">" [default "</span> (iproject-shorten-string iproject-last-base-directory-choosen 9) <span class="string">"]"</span>)
			    <span class="string">""</span>))
	    (file-str (<span class="keyword elisp">if</span> node-list (<span class="keyword elisp">if</span> (&gt; (length node-list) 1) <span class="string">"marked files"</span> <span class="string">"marked file"</span>) <span class="string">"current file"</span>)))
	(setq folder-name (read-from-minibuffer (format <span class="string">"Enter the base directory to move the %s into%s: "</span> file-str def-string)
						nil nil nil 'iproject-last-base-directory-history))))
    (<span class="keyword cl">unless</span> node-list
      (setq node-list (list current-node)))
    (iproject-move-files-within-project node-list folder-name)))


(<span class="keyword">defun</span> <span class="function">iproject-refresh-project</span>(project)
  <span class="string">"Reparse the directories associated to PROJECT, add the new files to it."</span>
  (<span class="keyword elisp">let</span> ((settings (project-buffer-get-project-settings-data project)))
    (<span class="keyword elisp">while</span> settings
      (<span class="keyword elisp">let</span> ((current (pop settings))
	    file-list)
	(<span class="keyword cl">when</span> (file-directory-p (nth 1 current))
	  <span class="comment">;; currest is a list (root-project-folder root-file-folder file-filter-list ignore-folder-list)</span>
	  (setq file-list (iproject-collect-files (nth 1 current) (nth 2 current) (nth 3 current)))
	  <span class="comment">;; Add each individual files to the project<span class="builtin">:</span></span>
	  (iproject-add-file-list-to-current-project project (nth 0 current) (nth 1 current) file-list)
	  )))))


(<span class="keyword">defun</span> <span class="function">iproject-refresh-handler</span>(project-list content)
  <span class="string">"Refresh all projects, check if there are new files to be added.
PROJECT-LIST is a list containing the project's names"</span>
  (<span class="keyword cl">when</span> (and project-list
	     (funcall project-buffer-confirm-function 
		      (<span class="keyword elisp">if</span> (cdr project-list) <span class="string">"Reparse the projects' directoriess "</span>
			  (format <span class="string">"Reparse %s's directories "</span> (car project-list)))))
    (<span class="keyword elisp">while</span> project-list
      (iproject-refresh-project (pop project-list)))))


(<span class="keyword">defun</span> <span class="function">iproject-setup-local-key</span>()
  <span class="string">"Define a local key-bindings."</span>
  (local-set-key [(control ?c) ?n] 'iproject-add-project)
  (local-set-key [(control ?c) ?+] 'iproject-add-files-to-current-project)
  (local-set-key [(control ?c) ?m] 'iproject-move-marked-files-or-current-file-within-project)

  (local-set-key [(control ?c) (control ?r)] 'project-buffer-revert)
  (local-set-key [(control ?x) (control ?s)] 'project-buffer-save-file)
  (local-set-key [(control ?x) (control ?w)] 'project-buffer-write-file))


<span class="comment">;;</span>
<span class="comment">;;  User commands<span class="builtin">:</span></span>
<span class="comment">;;</span>


<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">iproject-new</span> (name root-folder)
  <span class="string">"Create a iproject buffer named NAME with a `<span class="constant important">default-directory</span>' set to ROOT-FOLDER."</span>
  (interactive <span class="string">"sProject Buffer Name: \nDRoot Folder: "</span>)
  (<span class="keyword elisp">let</span> ((buffer (generate-new-buffer (concat <span class="string">"ipb:"</span> name))))
    (switch-to-buffer buffer)
    (<span class="keyword elisp">with-current-buffer</span> buffer
      (cd root-folder)
      (project-buffer-mode)
      <span class="comment">;; local variables<span class="builtin">:</span></span>
      (make-local-variable 'iproject-last-project-type-choosen)
      (make-local-variable 'iproject-last-filter-type-choosen)
      (make-local-variable 'iproject-last-file-filter-query-mode-choosen)
      (make-local-variable 'iproject-last-file-filter-regexp-choosen)
      (make-local-variable 'iproject-last-file-extension-list-choosen)
      (make-local-variable 'iproject-platform-list)
      (make-local-variable 'iproject-build-configuration-list)
      <span class="comment">;; register the local variable to be saved<span class="builtin">:</span></span>
      (add-to-list 'project-buffer-locals-to-save 'iproject-last-project-type-choosen)
      (add-to-list 'project-buffer-locals-to-save 'iproject-last-filter-type-choosen)
      (add-to-list 'project-buffer-locals-to-save 'iproject-last-file-filter-query-mode-choosen)
      (add-to-list 'project-buffer-locals-to-save 'iproject-last-file-filter-regexp-choosen)
      (add-to-list 'project-buffer-locals-to-save 'iproject-last-file-extension-list-choosen)
      (add-to-list 'project-buffer-locals-to-save 'iproject-platform-list)
      (add-to-list 'project-buffer-locals-to-save 'iproject-build-configuration-list)
      <span class="comment">;; ask for the platform list<span class="builtin">:</span></span>
      (setq iproject-platform-list            (split-string (read-from-minibuffer <span class="string">"Enter the list of platforms separated by spaces: "</span>
										  (<span class="keyword elisp">if</span> iproject-platforms-history (car iproject-platforms-history) (format <span class="string">"%s"</span> system-type))
										  nil nil 'iproject-platforms-history)))
      (setq iproject-build-configuration-list (split-string (read-from-minibuffer <span class="string">"Enter the list of build configurations separated by spaces: "</span>
										  (<span class="keyword elisp">if</span> iproject-build-configurations-history (car iproject-build-configurations-history) <span class="string">"release debug"</span>)
										  nil nil 'iproject-build-configurations-history)))
      <span class="comment">;;</span>
      (iproject-setup-local-key)
      (add-hook 'project-buffer-post-load-hook 'iproject-setup-local-key nil t)
      (add-hook 'project-buffer-action-hook    'iproject-action-handler  nil t)
      (add-hook 'project-buffer-refresh-hook   'iproject-refresh-handler nil t)
      )))


<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">iproject-key-binding</span> ()
  <span class="string">"Setup some global key-bindings."</span>
  (define-key global-map [(control x) (?p) (?n)] 'iproject-new)
  (define-key global-map [(control x) (?p) (?f)] 'project-buffer-find-file))


<span class="comment">;;</span>

(<span class="keyword">provide</span> '<span class="constant">iproject</span>)

<span class="comment">;;; iproject.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=iproject.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_iproject.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=iproject.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=iproject.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=iproject.el">Administration</a></span><span class="time"><br /> Last edited 2013-08-24 12:06 UTC by <a class="author" title="from 178-83-163-103.dynamic.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=iproject.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
