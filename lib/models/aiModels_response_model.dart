class AimodelsResponseModel {
  String? object;
  List<Data>? data;

  AimodelsResponseModel({this.object, this.data});

  AimodelsResponseModel.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['object'] = object;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? object;
  int? created;
  String? ownedBy;
  List<Permission>? permission;
  String? root;
  String? parent;

  Data(
      {this.id,
      this.object,
      this.created,
      this.ownedBy,
      this.permission,
      this.root,
      this.parent});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    ownedBy = json['owned_by'];
    if (json['permission'] != null) {
      permission = <Permission>[];
      json['permission'].forEach((v) {
        permission!.add(Permission.fromJson(v));
      });
    }
    root = json['root'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['owned_by'] = ownedBy;
    if (permission != null) {
      data['permission'] = permission!.map((v) => v.toJson()).toList();
    }
    data['root'] = root;
    data['parent'] = parent;
    return data;
  }
}

class Permission {
  String? id;
  String? object;
  int? created;
  bool? allowCreateEngine;
  bool? allowSampling;
  bool? allowLogprobs;
  bool? allowSearchIndices;
  bool? allowView;
  bool? allowFineTuning;
  String? organization;
  String? group;
  bool? isBlocking;

  Permission(
      {this.id,
      this.object,
      this.created,
      this.allowCreateEngine,
      this.allowSampling,
      this.allowLogprobs,
      this.allowSearchIndices,
      this.allowView,
      this.allowFineTuning,
      this.organization,
      this.group,
      this.isBlocking});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    allowCreateEngine = json['allow_create_engine'];
    allowSampling = json['allow_sampling'];
    allowLogprobs = json['allow_logprobs'];
    allowSearchIndices = json['allow_search_indices'];
    allowView = json['allow_view'];
    allowFineTuning = json['allow_fine_tuning'];
    organization = json['organization'];
    group = json['group'];
    isBlocking = json['is_blocking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['allow_create_engine'] = allowCreateEngine;
    data['allow_sampling'] = allowSampling;
    data['allow_logprobs'] = allowLogprobs;
    data['allow_search_indices'] = allowSearchIndices;
    data['allow_view'] = allowView;
    data['allow_fine_tuning'] = allowFineTuning;
    data['organization'] = organization;
    data['group'] = group;
    data['is_blocking'] = isBlocking;
    return data;
  }
}
