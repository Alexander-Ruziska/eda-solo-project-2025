const rejectUnauthenticated = (req, res, next) => {
  if (req.isAuthenticated()) {
    // We've verified the request came from an authenticated user, so
    // we call `next()` to advance to the next middleware function or
    // the route's callback function.

    // pool.query - update users set last_login to current time where user id is req.user.id
    next();
  } else {
    // The request came from an unauthenticated user, so we reply with
    // HTTP status code 403:
    res.sendStatus(403);
  }
};


module.exports = { rejectUnauthenticated };
