module FaceLib
  def face_default
    @face_override['eyes'] = false
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = false
    @face_override['mouth_open'] = false
    @face_override['brows'] = false
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_happy
    @face_override['eyes'] = false
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = 'smile'
    @face_override['mouth_open'] = 'tickle'
    @face_override['brows'] = false
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_tickle
    @face_override['eyes'] = 'happy'
    @face_override['eyes_closed'] = 'happy'
    @face_override['mouth'] = 'tickle'
    @face_override['mouth_open'] = 'tickle'
    @face_override['brows'] = 'tickle'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_annoyed
    @face_override['eyes'] = false
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = 'annoy1'
    @face_override['mouth_open'] = 'annoy2'
    @face_override['brows'] = 'annoy1'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_angry
    @face_override['eyes'] = 'normal1'
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = 'annoy1'
    @face_override['mouth_open'] = 'annoy2'
    @face_override['brows'] = 'annoy2'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_shy
    @face_override['eyes'] = 'left'
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = false
    @face_override['mouth_open'] = false
    @face_override['brows'] = 'worry'
    @face_override['blush'] = 2 #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end

  def face_afraid
    @face_override['eyes'] = false
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = false
    @face_override['mouth_open'] = false
    @face_override['brows'] = 'worry'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end

  def face_sad
    @face_override['eyes'] = 'normal1'
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = 'neutral'
    @face_override['mouth_open'] = false
    @face_override['brows'] = 'worry'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = 'yes' #'yes' or 'no'
  end
  def face_neutral
    @face_override['eyes'] = 'normal1'
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = 'neutral'
    @face_override['mouth_open'] = false
    @face_override['brows'] = 'normal'
    @face_override['blush'] = false #1,2 or 'none'
    @face_override['tears'] = false #'yes' or 'no'
  end
  def face_blush
    @face_override['eyes'] = 'left'
    @face_override['eyes_closed'] = false
    @face_override['mouth'] = false
    @face_override['mouth_open'] = false
    @face_override['brows'] = false
    @face_override['blush'] = 2 #1,2 or 'none'
    @face_override['tears'] = 'no' #'yes' or 'no'
  end

end