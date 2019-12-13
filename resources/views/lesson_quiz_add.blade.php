<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Question</h4>
        </div>

        <?php
        //var_dump($data->lesson_id);

        ?>
        <input type='hidden' id='opt_count' value="{!! isset($data->options) ? count($data->options) : 2 !!}"/>
        <form method='post' id="lessonQuizForm">
            <input type='hidden' id='lesson_quiz_id' name="lesson_quiz_id" value="{!! isset($data->id) ? $data->id : '' !!}"/>
            @csrf
            <div class="modal-body quizModal" id="lessonQuizModalBody">
                <span id="msg"></span>
                <div class="row">
                    <div class="col-sm-12">
                        <label>Question</label>
                        <input type='hidden' name='lesson_id' id="lesson_id" value="{!! isset($data->lesson_id) ? $data->lesson_id : '' !!}" />
                        <input type='hidden' name='is_active' value="1"/>
                        <input type='text' name='question' class='form-control' required value="{!! isset($data->question) ? $data->question : '' !!}" />
                    </div>
                </div>
                <div class="row" style="padding:15px">
                    <div class="col-sm-12" style="text-align:right">
                        <a href="javascript:;" onclick="addOptions('lessonQuizModalBody');"><i class="fa fa-plus"></i> Add Option</a> |
                        <a href="javascript:;" onclick="remOptions();"><i class="fa fa-times"></i> Remove Option</a>
                    </div>
                </div>
                @if(isset($data->options))
                    <input type="hidden" name="last_option" id="last_option" value="{!! count($data->options)-1 !!}">
                    @foreach($data->options as $key => $option)

                <div class="row" id="option-{!! $key; !!}">
                    <div class="col-sm-10 radioBtn" >
                        <label>Option {!! $key+1 !!}</label>
                        <input type='text' name='option[{!! $key !!}]' class='form-control' value="{!! $option->answer  !!}"  required />
                        <input type='radio'  name='correct[{!! $key !!}]' <?php if($option->is_correct == 1){ echo 'checked'; } ?> value="1" id="correct0"  />
                        <label for="correct0">Correct Answer</label>
                    </div>
                </div>
                @endforeach
                    @else
                    <input type="hidden" name="last_option" id="last_option" value="1">
                    <div class="row">
                        <div class="col-sm-10">
                            <label>Option 1</label>
                            <input type='text' name='option[]' class='form-control'  required />
                            <input type='radio' name='correct[]' value="1" id="correct1" />
                            <label for="correct1">Correct Answer</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10">
                            <label>Option 2</label>
                            <input type='text' name='option[]' class='form-control'  required />
                            <input type='radio' name='correct' value="1" id="correct1" />
                            <label for="correct1">Correct Answer</label>
                        </div>
                    </div>
                @endif

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="addBtn">Save changes</button>
            </div>
        </form>
    </div>
</div>