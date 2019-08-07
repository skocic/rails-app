require 'spec_helper'
require_relative '../../app/helpers/bitbucket_helper'

describe BitbucketHelper do
  let (:json) { JSON.parser('
      {  "rendered": {
            "description": {
                "raw": "DEV-69",
                "markup": "markdown",
                "html": "<p>DEV-69</p>",
                "type": "rendered"
            },
            "title": {
                "raw": "DEV-69 Deployment script",
                "markup": "markdown",
                "html": "<p>DEV-69 Deployment script</p>",
                "type": "rendered"
            }
        },
        "type": "pullrequest",
        "description": "DEV-69",
        "links": {
            "decline": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/decline"
            },
            "diffstat": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/diffstat/yogaeasydev/yogaeasy-rails:412887a1ff07%0D47c96d5edb7c?from_pullrequest_id=952"
            },
            "commits": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/commits"
            },
            "self": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952"
            },
            "comments": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/comments"
            },
            "merge": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/merge"
            },
            "html": {
                "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails/pull-requests/952"
            },
            "activity": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/activity"
            },
            "diff": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/diff/yogaeasydev/yogaeasy-rails:412887a1ff07%0D47c96d5edb7c?from_pullrequest_id=952"
            },
            "approve": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/approve"
            },
            "statuses": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/pullrequests/952/statuses"
            }
        },
        "title": "DEV-69 Deployment script",
        "close_source_branch": true,
        "reviewers": [
            {
                "display_name": "Radomir Zugic",
                "account_id": "557058:24d7cb83-7412-47b5-bfaa-568dc12265b7",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/users/%7B76b49315-f824-4825-9cd6-85bbe8a413ad%7D"
                    },
                    "html": {
                        "href": "https://bitbucket.org/%7B76b49315-f824-4825-9cd6-85bbe8a413ad%7D/"
                    },
                    "avatar": {
                        "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/557058:24d7cb83-7412-47b5-bfaa-568dc12265b7/96617b8b-2cc4-483d-96c4-7502503f4666/128"
                    }
                },
                "nickname": "Radomir Zugic",
                "type": "user",
                "uuid": "{76b49315-f824-4825-9cd6-85bbe8a413ad}"
            },
            {
                "display_name": "Radomir Zugic",
                "account_id": "557058:9d63b088-39fc-4001-a069-7831e80003aa",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/users/%7Bb02ab760-2e96-449c-bf97-c290d14c4b8d%7D"
                    },
                    "html": {
                        "href": "https://bitbucket.org/%7Bb02ab760-2e96-449c-bf97-c290d14c4b8d%7D/"
                    },
                    "avatar": {
                        "href": "https://secure.gravatar.com/avatar/abed258fa83c1fc316e9f82fd4267619?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FRZ-3.png"
                    }
                },
                "nickname": "Jenkins CI (admin)",
                "type": "user",
                "uuid": "{b02ab760-2e96-449c-bf97-c290d14c4b8d}"
            },
            {
                "display_name": "Umut Gundogdu",
                "account_id": "557058:64ce80db-8da7-4b20-a055-5adf220d38f9",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/users/%7Baef313e4-d948-4d00-b499-9bd7f684970c%7D"
                    },
                    "html": {
                        "href": "https://bitbucket.org/%7Baef313e4-d948-4d00-b499-9bd7f684970c%7D/"
                    },
                    "avatar": {
                        "href": "https://secure.gravatar.com/avatar/950b958b897788bbbf33120a95ae8005?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FUG-0.png"
                    }
                },
                "nickname": "Umut Gundogdu",
                "type": "user",
                "uuid": "{aef313e4-d948-4d00-b499-9bd7f684970c}"
            },
            {
                "display_name": "RAVI KUMAR",
                "account_id": "5cf4c94a3fc4980fa4f070ef",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/users/%7B67a312e2-5de1-4af1-a550-4d9aff2ca638%7D"
                    },
                    "html": {
                        "href": "https://bitbucket.org/%7B67a312e2-5de1-4af1-a550-4d9aff2ca638%7D/"
                    },
                    "avatar": {
                        "href": "https://secure.gravatar.com/avatar/933ce206f04da1a121c4cf1e41f03ddf?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FRK-4.png"
                    }
                },
                "nickname": "RAVI KUMAR",
                "type": "user",
                "uuid": "{67a312e2-5de1-4af1-a550-4d9aff2ca638}"
            }
        ],
        "id": 952,
        "destination": {
            "commit": {
                "hash": "47c96d5edb7c",
                "type": "commit",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/commit/47c96d5edb7c"
                    },
                    "html": {
                        "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails/commits/47c96d5edb7c"
                    }
                }
            },
            "repository": {
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails"
                    },
                    "html": {
                        "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails"
                    },
                    "avatar": {
                        "href": "https://bytebucket.org/ravatar/%7B0baf7598-19e8-4172-ac20-c2759c5f8320%7D?ts=default"
                    }
                },
                "type": "repository",
                "name": "yogaeasy-rails",
                "full_name": "yogaeasydev/yogaeasy-rails",
                "uuid": "{0baf7598-19e8-4172-ac20-c2759c5f8320}"
            },
            "branch": {
                "name": "develop"
            }
        },
        "created_on": "2019-08-06T09:49:23.836968+00:00",
        "summary": {
            "raw": "DEV-69",
            "markup": "markdown",
            "html": "<p>DEV-69</p>",
            "type": "rendered"
        },
        "source": {
            "commit": {
                "hash": "298ab0ad09a1",
                "type": "commit",
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/commit/298ab0ad09a1"
                    },
                    "html": {
                        "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails/commits/298ab0ad09a1"
                    }
                }
            },
            "repository": {
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails"
                    },
                    "html": {
                        "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails"
                    },
                    "avatar": {
                        "href": "https://bytebucket.org/ravatar/%7B0baf7598-19e8-4172-ac20-c2759c5f8320%7D?ts=default"
                    }
                },
                "type": "repository",
                "name": "yogaeasy-rails",
                "full_name": "yogaeasydev/yogaeasy-rails",
                "uuid": "{0baf7598-19e8-4172-ac20-c2759c5f8320}"
            },
            "branch": {
                "name": "feature/DEV-69-deployment-script"
            }
        },
        "comment_count": 0,
        "state": "MERGED",
        "task_count": 0,
        "participants": [
            {
                "role": "REVIEWER",
                "participated_on": "2019-08-06T10:25:59.273793+00:00",
                "type": "participant",
                "user": {
                    "display_name": "RAVI KUMAR",
                    "account_id": "5cf4c94a3fc4980fa4f070ef",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B67a312e2-5de1-4af1-a550-4d9aff2ca638%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B67a312e2-5de1-4af1-a550-4d9aff2ca638%7D/"
                        },
                        "avatar": {
                            "href": "https://secure.gravatar.com/avatar/933ce206f04da1a121c4cf1e41f03ddf?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FRK-4.png"
                        }
                    },
                    "nickname": "RAVI KUMAR",
                    "type": "user",
                    "uuid": "{67a312e2-5de1-4af1-a550-4d9aff2ca638}"
                },
                "approved": true
            },
            {
                "role": "PARTICIPANT",
                "participated_on": "2019-08-06T13:29:20.517158+00:00",
                "type": "participant",
                "user": {
                    "display_name": "Saša Kocić",
                    "account_id": "557058:0e588aa5-54d1-4f53-b82c-d3706f6e579f",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D/"
                        },
                        "avatar": {
                            "href": "https://secure.gravatar.com/avatar/61eafa897367773f2c5e38b2a4c55195?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FSK-5.png"
                        }
                    },
                    "nickname": "Saša Kocić",
                    "type": "user",
                    "uuid": "{c09d22aa-bc53-42b2-9545-43c6201c1bee}"
                },
                "approved": true
            },
            {
                "role": "REVIEWER",
                "participated_on": "2019-08-06T13:13:12.146574+00:00",
                "type": "participant",
                "user": {
                    "display_name": "Radomir Zugic",
                    "account_id": "557058:24d7cb83-7412-47b5-bfaa-568dc12265b7",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B76b49315-f824-4825-9cd6-85bbe8a413ad%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B76b49315-f824-4825-9cd6-85bbe8a413ad%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/557058:24d7cb83-7412-47b5-bfaa-568dc12265b7/96617b8b-2cc4-483d-96c4-7502503f4666/128"
                        }
                    },
                    "nickname": "Radomir Zugic",
                    "type": "user",
                    "uuid": "{76b49315-f824-4825-9cd6-85bbe8a413ad}"
                },
                "approved": true
            },
            {
                "role": "REVIEWER",
                "participated_on": "2019-08-06T10:56:24.902670+00:00",
                "type": "participant",
                "user": {
                    "display_name": "Umut Gundogdu",
                    "account_id": "557058:64ce80db-8da7-4b20-a055-5adf220d38f9",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7Baef313e4-d948-4d00-b499-9bd7f684970c%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7Baef313e4-d948-4d00-b499-9bd7f684970c%7D/"
                        },
                        "avatar": {
                            "href": "https://secure.gravatar.com/avatar/950b958b897788bbbf33120a95ae8005?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FUG-0.png"
                        }
                    },
                    "nickname": "Umut Gundogdu",
                    "type": "user",
                    "uuid": "{aef313e4-d948-4d00-b499-9bd7f684970c}"
                },
                "approved": true
            },
            {
                "role": "REVIEWER",
                "participated_on": "2019-08-06T10:16:08.941770+00:00",
                "type": "participant",
                "user": {
                    "display_name": "Radomir Zugic",
                    "account_id": "557058:9d63b088-39fc-4001-a069-7831e80003aa",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7Bb02ab760-2e96-449c-bf97-c290d14c4b8d%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7Bb02ab760-2e96-449c-bf97-c290d14c4b8d%7D/"
                        },
                        "avatar": {
                            "href": "https://secure.gravatar.com/avatar/abed258fa83c1fc316e9f82fd4267619?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FRZ-3.png"
                        }
                    },
                    "nickname": "Jenkins CI (admin)",
                    "type": "user",
                    "uuid": "{b02ab760-2e96-449c-bf97-c290d14c4b8d}"
                },
                "approved": true
            }
        ],
        "reason": "",
        "updated_on": "2019-08-06T18:31:36.303795+00:00",
        "author": {
            "display_name": "Saša Kocić",
            "account_id": "557058:0e588aa5-54d1-4f53-b82c-d3706f6e579f",
            "links": {
                "self": {
                    "href": "https://api.bitbucket.org/2.0/users/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D"
                },
                "html": {
                    "href": "https://bitbucket.org/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D/"
                },
                "avatar": {
                    "href": "https://secure.gravatar.com/avatar/61eafa897367773f2c5e38b2a4c55195?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FSK-5.png"
                }
            },
            "nickname": "Saša Kocić",
            "type": "user",
            "uuid": "{c09d22aa-bc53-42b2-9545-43c6201c1bee}"
        },
        "merge_commit": {
            "hash": "412887a1ff07",
            "type": "commit",
            "links": {
                "self": {
                    "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails/commit/412887a1ff07"
                },
                "html": {
                    "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails/commits/412887a1ff07"
                }
            }
        },
        "closed_by": {
            "display_name": "Saša Kocić",
            "account_id": "557058:0e588aa5-54d1-4f53-b82c-d3706f6e579f",
            "links": {
                "self": {
                    "href": "https://api.bitbucket.org/2.0/users/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D"
                },
                "html": {
                    "href": "https://bitbucket.org/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D/"
                },
                "avatar": {
                    "href": "https://secure.gravatar.com/avatar/61eafa897367773f2c5e38b2a4c55195?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FSK-5.png"
                }
            },
            "nickname": "Saša Kocić",
            "type": "user",
            "uuid": "{c09d22aa-bc53-42b2-9545-43c6201c1bee}"
        }
    },
        "repository": {
        "scm": "git",
        "website": "",
        "name": "yogaeasy-rails",
        "links": {
            "self": {
                "href": "https://api.bitbucket.org/2.0/repositories/yogaeasydev/yogaeasy-rails"
            },
            "html": {
                "href": "https://bitbucket.org/yogaeasydev/yogaeasy-rails"
            },
            "avatar": {
                "href": "https://bytebucket.org/ravatar/%7B0baf7598-19e8-4172-ac20-c2759c5f8320%7D?ts=default"
            }
        },
        "project": {
            "key": "YRA",
            "type": "project",
            "uuid": "{9bcd9b9b-4189-4229-a992-eebaa766dfcf}",
            "links": {
                "self": {
                    "href": "https://api.bitbucket.org/2.0/teams/yogaeasydev/projects/YRA"
                },
                "html": {
                    "href": "https://bitbucket.org/account/user/yogaeasydev/projects/YRA"
                },
                "avatar": {
                    "href": "https://bitbucket.org/account/user/yogaeasydev/projects/YRA/avatar/32"
                }
            },
            "name": "YogaEasy Rails App"
        },
        "full_name": "yogaeasydev/yogaeasy-rails",
        "owner": {
            "username": "yogaeasydev",
            "display_name": "YogaEasy Dev ",
            "type": "team",
            "uuid": "{aae59b45-8d07-4bb4-9e4d-87b2e79f4a4e}",
            "links": {
                "self": {
                    "href": "https://api.bitbucket.org/2.0/teams/%7Baae59b45-8d07-4bb4-9e4d-87b2e79f4a4e%7D"
                },
                "html": {
                    "href": "https://bitbucket.org/%7Baae59b45-8d07-4bb4-9e4d-87b2e79f4a4e%7D/"
                },
                "avatar": {
                    "href": "https://bitbucket.org/account/yogaeasydev/avatar/"
                }
            }
        },
        "type": "repository",
        "is_private": true,
        "uuid": "{0baf7598-19e8-4172-ac20-c2759c5f8320}"
    },
        "actor": {
        "display_name": "Saša Kocić",
        "account_id": "557058:0e588aa5-54d1-4f53-b82c-d3706f6e579f",
        "links": {
            "self": {
                "href": "https://api.bitbucket.org/2.0/users/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D"
            },
            "html": {
                "href": "https://bitbucket.org/%7Bc09d22aa-bc53-42b2-9545-43c6201c1bee%7D/"
            },
            "avatar": {
                "href": "https://secure.gravatar.com/avatar/61eafa897367773f2c5e38b2a4c55195?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FSK-5.png"
            }
        },
        "nickname": "Saša Kocić",
        "type": "user",
        "uuid": "{c09d22aa-bc53-42b2-9545-43c6201c1bee}"
    }
  }') }
  describe "#get_branch" do
    it 'gets the branch' do
      expect(params).to eq(true)
    end
  end
end
