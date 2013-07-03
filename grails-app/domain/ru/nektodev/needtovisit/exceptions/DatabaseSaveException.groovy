package ru.nektodev.needtovisit.exceptions

/**
 * User: tsykin.vyacheslav 
 *       tsykin.vyacheslav@otr.ru
 * Date: 24/06/13 15:29
 */
class DatabaseSaveException extends Exception {
    DatabaseSaveException(String message) {
        super(message)
    }
}
