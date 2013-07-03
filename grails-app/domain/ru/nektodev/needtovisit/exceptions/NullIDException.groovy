package ru.nektodev.needtovisit.exceptions

/**
 * @author nektodev
 *         ts.slawa@gmail.com
 */
class NullIDException extends Exception {
    NullIDException() {
        super()
    }

    NullIDException(String message) {
        super(message)
    }

    NullIDException(String message, Throwable cause) {
        super(message, cause)
    }

    NullIDException(Throwable cause) {
        super(cause)
    }

    protected NullIDException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace)
    }
}
