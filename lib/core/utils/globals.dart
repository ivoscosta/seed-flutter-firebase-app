import 'dart:async';

import 'package:seed_flutter_app/core/models/user_profile.dart';

// URLS
const SITE = 'https://www.agrosegurancabrasil.com.br';
const DEFAULT_IMAGE =
    'https://firebasestorage.googleapis.com/v0/b/agro-seguranca-brasil-dev.appspot.com/o/defaults%2Fdefault_image.jpg?alt=media&token=e00e821c-a645-4b96-85c7-50b5c6f34f45';
const DEFAULT_AVATAR_URL =
    'https://firebasestorage.googleapis.com/v0/b/agro-seguranca-brasil-dev.appspot.com/o/defaults%2Fdefault_avatar.jpg?alt=media&token=f6b01b7b-1d6c-46a6-aa24-08468968622a';

//VAR
UserProfile?
    currentUser; //guarda o usuário corrente da aplicação, se for nulo é porque está desautenticado
StreamController<String> currentUserStreamController = StreamController<
    String>(); //guarda o controlador de stream para atualização global do usuário
