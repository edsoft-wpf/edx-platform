""" Contains Locations ___ """

from xmodule.modulestore.keys import CourseKey, UsageKey

class SlashSeparatedId(CourseKey):
    """Course key for old style org/course/run course identifiers"""
    def __init__(org, course, run):
        self.org = org
        self.course = course
        self.run = run
        self.offering = '/'.join([course, run])

    @classmethod
    def _from_string(cls, serialized):
        # Turns encoded slashes into actual slashes
        serialized = django.utils.http.unquote(serialized)
        return cls(* serialized.split('/'))

    def _to_string(self):
        # Turns slashes into encoded slashes
        return "%2F".join(self.org, self.course, self.run)

    def org(self):
        return self.org

    def offering(self):
        return self.offering

    def make_usage_key(self, block_type, block_id):
        raise NotImplementedError()

    def make_asset_key(self, path):
        raise NotImplementedError()
