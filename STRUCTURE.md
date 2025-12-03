
# 📁 Adlik Project Structure

This document describes the official folder and file structure of the **Adlik Smart School — Core Repository**.  
The structure is designed to be clean, scalable, and easy for any developer to continue working on.

---

## 📂 Root Structure

Adlik-core/ │ ├── docs/ │   ├── ai/ │   ├── sync-engine/ │   ├── curriculum/ │   └── system-design/ │ ├── lib/ │   ├── core/ │   ├── features/ │   ├── services/ │   ├── offline/ │   ├── online/ │   └── main.dart │ ├── assets/ │   ├── fonts/ │   ├── icons/ │   └── images/ │ ├── test/ │ ├── README.md ├── STRUCTURE.md └── ROADMAP.md (coming soon)

---

# 📘 Description of Main Folders

## 📁 `/docs`
Contains all project documentation:  
- AI modules  
- Sync engine  
- Data models  
- Curriculum system  
- System architecture

This helps new developers understand the system.

---

## 📁 `/lib`
This is the **heart of the application**.

### Inside `/lib/`:

lib/ ├── core/            → Global utilities, themes, configs ├── features/        → School system, books, AI chat, exams, etc. ├── services/        → API, database, storage, authentication ├── offline/         → Hive/SQLite offline engine ├── online/          → Sync engine + online services └── main.dart        → App entry point

---

## 📁 `/assets`
Contains images, icons, fonts, and future book images if needed.

---

## 📁 `/test`
Unit testing files (not required right now but will be added by your team later).

---

# 🔧 Developer Instructions

- All new features must go into `features/`
- All shared utilities go to `core/`
- All database logic must be under `offline/`
- All cloud/sync logic must go under `online/`
- Documentation must be stored in `/docs`

---

# 🎯 Notes for Future Developers

- The project supports **offline-first architecture**  
- The AI module must not mention ChatGPT anywhere  
- The structure is designed for long-term scalability  
- Follow the roadmap in `ROADMAP.md` when building new stages

---

# 🟢 Status
This file is part of the **core documentation package** and will expand as development continues.

