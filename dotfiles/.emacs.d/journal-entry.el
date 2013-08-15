(defvar org-journal-file "~/Documents/journal/journal.org"  
  "Path to OrgMode journal file.")  
(defvar org-journal-date-format "%Y-%m-%d"  
  "Date format string for journal headings.")  
  
(defun org-journal-entry ()  
  "Create a new diary entry for today or append to an existing one."  
  (interactive)  
  (switch-to-buffer (find-file org-journal-file))  
  (widen)
  (let ((isearch-forward t) (today (format-time-string org-journal-date-format)))
    (beginning-of-buffer)  
    (unless (org-goto-local-search-headings today nil t)  
      ((lambda ()   
         (org-insert-heading)  
         (insert today)  
         (insert "\n\n  \n"))))  
    (beginning-of-buffer)  
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)  
    (backward-char 2)  
    (unless (= (current-column) 2)  
      (insert "\n\n  "))))
