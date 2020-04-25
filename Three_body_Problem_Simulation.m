function varargout = Three_body_Problem_Simulation(varargin)
%THREE_BODY_PROBLEM_SIMULATION MATLAB code file for Three_body_Problem_Simulation.fig
%      THREE_BODY_PROBLEM_SIMULATION, by itself, creates a new THREE_BODY_PROBLEM_SIMULATION or raises the existing
%      singleton*.
%
%      H = THREE_BODY_PROBLEM_SIMULATION returns the handle to a new THREE_BODY_PROBLEM_SIMULATION or the handle to
%      the existing singleton*.
%
%      THREE_BODY_PROBLEM_SIMULATION('Property','Value',...) creates a new THREE_BODY_PROBLEM_SIMULATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Three_body_Problem_Simulation_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      THREE_BODY_PROBLEM_SIMULATION('CALLBACK') and THREE_BODY_PROBLEM_SIMULATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in THREE_BODY_PROBLEM_SIMULATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Three_body_Problem_Simulation

% Last Modified by GUIDE v2.5 24-Apr-2020 20:53:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Three_body_Problem_Simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @Three_body_Problem_Simulation_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Three_body_Problem_Simulation is made visible.
function Three_body_Problem_Simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Three_body_Problem_Simulation
handles.output = hObject;
cla(handles.sims);
handles.hist = [];
handles.integrator = [];
handles.mass = [];
handles.init_r = [];
handles.init_v = [];
handles.method = 'euler';
Earth = containers.Map({'mass', 'aphelion', 'perihelion', 'period', 'aph_speed', 'per_speed'}, ...
                       [5.9722e24, 1.0167, 0.98329, 365.256363004, 29290, 30290]);
handles.DAY = 24*60*60; % s
handles.YEAR = Earth('period') * handles.DAY; % s
handles.AU = 149597870700 * Earth('aphelion'); % m
handles.V = Earth('aph_speed'); % m/s
handles.M = Earth('mass');
handles.iter = 365;
handles.steps = 1;
handles.rep_freq = 1;
set(handles.alert, 'String', 'READY');
set(handles.show, 'Enable', 'off');
set(handles.stop, 'Enable', 'off');
set(handles.save, 'Enable', 'off');
set(handles.options, 'Visible', 'off');
set(handles.opn_options, 'UserData', 0);
view(45,45);
grid on;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Three_body_Problem_Simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Three_body_Problem_Simulation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function v1_x_Callback(hObject, eventdata, handles)
% hObject    handle to v1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v1_x as text
%        str2double(get(hObject,'String')) returns contents of v1_x as a double


% --- Executes during object creation, after setting all properties.
function v1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v2_x_Callback(hObject, eventdata, handles)
% hObject    handle to v2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v2_x as text
%        str2double(get(hObject,'String')) returns contents of v2_x as a double


% --- Executes during object creation, after setting all properties.
function v2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v3_x_Callback(hObject, eventdata, handles)
% hObject    handle to v3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v3_x as text
%        str2double(get(hObject,'String')) returns contents of v3_x as a double


% --- Executes during object creation, after setting all properties.
function v3_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v1_y_Callback(hObject, eventdata, handles)
% hObject    handle to v1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v1_y as text
%        str2double(get(hObject,'String')) returns contents of v1_y as a double


% --- Executes during object creation, after setting all properties.
function v1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v2_y_Callback(hObject, eventdata, handles)
% hObject    handle to v2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v2_y as text
%        str2double(get(hObject,'String')) returns contents of v2_y as a double


% --- Executes during object creation, after setting all properties.
function v2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v3_y_Callback(hObject, eventdata, handles)
% hObject    handle to v3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v3_y as text
%        str2double(get(hObject,'String')) returns contents of v3_y as a double


% --- Executes during object creation, after setting all properties.
function v3_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v1_z_Callback(hObject, eventdata, handles)
% hObject    handle to v1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v1_z as text
%        str2double(get(hObject,'String')) returns contents of v1_z as a double


% --- Executes during object creation, after setting all properties.
function v1_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v2_z_Callback(hObject, eventdata, handles)
% hObject    handle to v2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v2_z as text
%        str2double(get(hObject,'String')) returns contents of v2_z as a double


% --- Executes during object creation, after setting all properties.
function v2_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v3_z_Callback(hObject, eventdata, handles)
% hObject    handle to v3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v3_z as text
%        str2double(get(hObject,'String')) returns contents of v3_z as a double


% --- Executes during object creation, after setting all properties.
function v3_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_x_Callback(hObject, eventdata, handles)
% hObject    handle to r1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1_x as text
%        str2double(get(hObject,'String')) returns contents of r1_x as a double


% --- Executes during object creation, after setting all properties.
function r1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_x_Callback(hObject, eventdata, handles)
% hObject    handle to r2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2_x as text
%        str2double(get(hObject,'String')) returns contents of r2_x as a double


% --- Executes during object creation, after setting all properties.
function r2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_x_Callback(hObject, eventdata, handles)
% hObject    handle to r3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r3_x as text
%        str2double(get(hObject,'String')) returns contents of r3_x as a double


% --- Executes during object creation, after setting all properties.
function r3_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_y_Callback(hObject, eventdata, handles)
% hObject    handle to r1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1_y as text
%        str2double(get(hObject,'String')) returns contents of r1_y as a double


% --- Executes during object creation, after setting all properties.
function r1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_y_Callback(hObject, eventdata, handles)
% hObject    handle to r2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2_y as text
%        str2double(get(hObject,'String')) returns contents of r2_y as a double


% --- Executes during object creation, after setting all properties.
function r2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_y_Callback(hObject, eventdata, handles)
% hObject    handle to r3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r3_y as text
%        str2double(get(hObject,'String')) returns contents of r3_y as a double


% --- Executes during object creation, after setting all properties.
function r3_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_z_Callback(hObject, eventdata, handles)
% hObject    handle to r1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1_z as text
%        str2double(get(hObject,'String')) returns contents of r1_z as a double


% --- Executes during object creation, after setting all properties.
function r1_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_z_Callback(hObject, eventdata, handles)
% hObject    handle to r2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2_z as text
%        str2double(get(hObject,'String')) returns contents of r2_z as a double


% --- Executes during object creation, after setting all properties.
function r2_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_z_Callback(hObject, eventdata, handles)
% hObject    handle to r3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r3_z as text
%        str2double(get(hObject,'String')) returns contents of r3_z as a double


% --- Executes during object creation, after setting all properties.
function r3_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mass1_Callback(hObject, eventdata, handles)
% hObject    handle to mass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mass1 as text
%        str2double(get(hObject,'String')) returns contents of mass1 as a double


% --- Executes during object creation, after setting all properties.
function mass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mass2_Callback(hObject, eventdata, handles)
% hObject    handle to mass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mass2 as text
%        str2double(get(hObject,'String')) returns contents of mass2 as a double


% --- Executes during object creation, after setting all properties.
function mass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mass3_Callback(hObject, eventdata, handles)
% hObject    handle to mass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mass3 as text
%        str2double(get(hObject,'String')) returns contents of mass3 as a double


% --- Executes during object creation, after setting all properties.
function mass3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timestep_Callback(hObject, eventdata, handles)
% hObject    handle to timestep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timestep as text
%        str2double(get(hObject,'String')) returns contents of timestep as a double


% --- Executes during object creation, after setting all properties.
function timestep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timestep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterations_Callback(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations as text
%        str2double(get(hObject,'String')) returns contents of iterations as a double


% --- Executes during object creation, after setting all properties.
function iterations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rep_frq_Callback(hObject, eventdata, handles)
% hObject    handle to rep_frq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rep_frq as text
%        str2double(get(hObject,'String')) returns contents of rep_frq as a double


% --- Executes during object creation, after setting all properties.
function rep_frq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rep_frq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.hist)
    return
end
set(handles.stop, 'UserData', 0);
set(handles.start, 'Enable', 'off');
set(handles.save, 'Enable', 'off');
set(handles.load, 'Enable', 'off');
set(handles.show, 'Enable', 'off');

cla(handles.sims);
axes(handles.sims);
handles.rep_freq = str2double(get(handles.rep_frq, 'String'));

max_range = 0;
min_range = Inf;
for index = 1:length(handles.hist)
    min_dim = min([handles.hist(index).get_min('pos', 'x'), ...
                   handles.hist(index).get_min('pos', 'y'), ...
                   handles.hist(index).get_min('pos', 'z')]);
    max_dim = max([handles.hist(index).get_max('pos', 'x'), ...
                   handles.hist(index).get_max('pos', 'y'), ...
                   handles.hist(index).get_max('pos', 'z')]);
    
    if abs(max_dim) > max_range
        max_range = max_dim;
    end
    if min_dim < min_range
        min_range = min_dim;
    end
end

orbit1 = animatedline('LineWidth', 1, 'Color', 'r');
orbit2 = animatedline('LineWidth', 1, 'Color', 'g');
orbit3 = animatedline('LineWidth', 1, 'Color', 'b');

if max_range > min_range
    set(gca, 'XLim', [min_range max_range], 'YLim', [min_range max_range], 'ZLim', [min_range max_range]);
end
hold on;
daspect([1 1 1]);

set(handles.alert, 'String', 'SIMULATING...');
steps = handles.hist(1).num_of_pos;
for i = 1:handles.rep_freq:steps
    body1 = num2cell(handles.hist(1).positions(i, :));
    body2 = num2cell(handles.hist(2).positions(i, :));
    body3 = num2cell(handles.hist(3).positions(i, :));
    addpoints(orbit1, body1{:});
    head1 = scatter3(body1{:}, 'filled', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
    addpoints(orbit2, body2{:});
    head2 = scatter3(body2{:}, 'filled', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k');
    addpoints(orbit3, body3{:});
    head3 = scatter3(body3{:}, 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');
    
    drawnow();
    if get(handles.status, 'Value')
        vel1 = num2cell(handles.hist(1).velocities(i, :));
        vel2 = num2cell(handles.hist(2).velocities(i, :));
        vel3 = num2cell(handles.hist(3).velocities(i, :));
        set(handles.cur_iter, 'String', num2str(i));
        set(handles.r1, 'String', sprintf('%.3fx  %.3fy  %.3fz', body1{:}));
        set(handles.r2, 'String', sprintf('%.3fx  %.3fy  %.3fz', body2{:}));
        set(handles.r3, 'String', sprintf('%.3fx  %.3fy  %.3fz', body3{:}));
        set(handles.v1, 'String', sprintf('%.3fx  %.3fy  %.3fz', vel1{:}));
        set(handles.v2, 'String', sprintf('%.3fx  %.3fy  %.3fz', vel2{:}));
        set(handles.v3, 'String', sprintf('%.3fx  %.3fy  %.3fz', vel3{:}));
    end
    
    if get(handles.stop, 'UserData')
        break
    end
    
    if i + handles.rep_freq <= steps        
        delete(head1);
        delete(head2);
        delete(head3);
    end
end

if get(handles.stop, 'UserData')
    set(handles.alert, 'String', 'SIMULATION STOPPED');
else
    set(handles.alert, 'String', 'SIMULATION COMPLETE');
end
hold off;

set(handles.start, 'Enable', 'on');
set(handles.save, 'Enable', 'on');
set(handles.load, 'Enable', 'on');
set(handles.show, 'Enable', 'on');
guidata(hObject, handles);


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.hist = [];
set(handles.start, 'Enable', 'off');
set(handles.show, 'Enable', 'off');
set(handles.stop, 'Enable', 'off');
set(handles.save, 'Enable', 'off');
set(handles.load, 'Enable', 'off');
set(handles.reset, 'Enable', 'off');

handles.mass = [str2double(get(handles.mass1, 'String')), ...
                str2double(get(handles.mass2, 'String')), ...
                str2double(get(handles.mass3, 'String'))] * handles.M;

handles.init_r = [Point(str2double(get(handles.r1_x, 'String')), str2double(get(handles.r1_y, 'String')), str2double(get(handles.r1_z, 'String'))), ...
                  Point(str2double(get(handles.r2_x, 'String')), str2double(get(handles.r2_y, 'String')), str2double(get(handles.r2_z, 'String'))), ...
                  Point(str2double(get(handles.r3_x, 'String')), str2double(get(handles.r3_y, 'String')), str2double(get(handles.r3_z, 'String')))];

handles.init_v = [Point(str2double(get(handles.v1_x, 'String')), str2double(get(handles.v1_y, 'String')), str2double(get(handles.v1_z, 'String'))), ...
                  Point(str2double(get(handles.v2_x, 'String')), str2double(get(handles.v2_y, 'String')), str2double(get(handles.v2_z, 'String'))), ...
                  Point(str2double(get(handles.v3_x, 'String')), str2double(get(handles.v3_y, 'String')), str2double(get(handles.v3_z, 'String')))];

for idx = 1:3
    handles.init_r(idx).scale(handles.AU);
    handles.init_v(idx).scale(handles.V);
end


handles.steps = handles.DAY * str2double(get(handles.timestep, 'String'));
handles.iter = str2double(get(handles.iterations, 'String'));
handles.rep_freq = str2double(get(handles.rep_frq, 'String'));

bodies = Body(0,0,0);
for i=1:3
    bodies(i) = Body(handles.mass(i), handles.init_r(i), handles.init_v(i), ['star' num2str(i)]);
end

if handles.method=="euler"
    handles.integrator = Euler_integrator(handles.steps, bodies);
else
    handles.integrator = RK4_integrator(handles.steps, bodies);
end
set(handles.alert, 'String', 'CALCULATION IN PROGRESS...');

tic
[handles.hist, iter] = calc_orbit(handles.integrator, handles.iter, get(handles.est, 'Value'));
stop = toc;

for idx = 1:3
    handles.hist(idx).pos_scale(1/handles.AU);
    handles.hist(idx).vel_scale(1/handles.V);
end

if iter ~= handles.iter
    set(handles.iterations, 'String', num2str(iter));
end
set(handles.alert, 'String', sprintf('COMPLETED IN %s', datestr(seconds(stop),'HH:MM:SS')));
set(handles.start, 'Enable', 'on');
set(handles.show, 'Enable', 'on');
set(handles.stop, 'Enable', 'on');
set(handles.save, 'Enable', 'on');
set(handles.load, 'Enable', 'on');
set(handles.reset, 'Enable', 'on');
guidata(hObject, handles);



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.stop, 'UserData', 1);
handles.integrator = [];
handles.mass = [];
handles.init_r = [];
handles.init_v = [];
handles.iter = 365;
handles.steps = 1;
handles.rep_freq = 1;
handles.method = 'euler';
handles.hist = [];
cla('reset');
set(handles.az, 'String', '45');
set(handles.el, 'String', '45');
view(45,45);
grid on;
set(handles.methods, 'selectedobject', handles.euler);
set(handles.mass1, 'String', '0');
set(handles.mass2, 'String', '0');
set(handles.mass3, 'String', '0');
set(handles.r1_x, 'String', '0');
set(handles.r1_y, 'String', '0');
set(handles.r1_z, 'String', '0');
set(handles.r2_x, 'String', '0');
set(handles.r2_y, 'String', '0');
set(handles.r2_z, 'String', '0');
set(handles.r3_x, 'String', '0');
set(handles.r3_y, 'String', '0');
set(handles.r3_z, 'String', '0');
set(handles.v1_x, 'String', '0');
set(handles.v1_y, 'String', '0');
set(handles.v1_z, 'String', '0');
set(handles.v2_x, 'String', '0');
set(handles.v2_y, 'String', '0');
set(handles.v2_z, 'String', '0');
set(handles.v3_x, 'String', '0');
set(handles.v3_y, 'String', '0');
set(handles.v3_z, 'String', '0');
set(handles.timestep, 'String', num2str(handles.steps));
set(handles.iterations, 'String', num2str(handles.iter));
set(handles.rep_frq, 'String', num2str(handles.rep_freq));
set(handles.cur_iter, 'String', '0');
set(handles.r1, 'String', '0x   0y   0z');
set(handles.v1, 'String', '0x   0y   0z');
set(handles.r2, 'String', '0x   0y   0z');
set(handles.v2, 'String', '0x   0y   0z');
set(handles.r3, 'String', '0x   0y   0z');
set(handles.v3, 'String', '0x   0y   0z');
set(handles.alert, 'String', 'READY');
set(handles.show, 'Enable', 'off');
set(handles.stop, 'Enable', 'off');
set(handles.save, 'Enable', 'off');
set(handles.load, 'Enable', 'on');
set(handles.start, 'Enable', 'on');
guidata(hObject, handles);


% --- Executes when selected object is changed in methods.
function methods_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in methods 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.method = get(eventdata.NewValue,'Tag');
guidata(hObject,handles);


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.stop, 'UserData', 1);
set(handles.start, 'Enable', 'on');
set(handles.save, 'Enable', 'on');
set(handles.load, 'Enable', 'on');
set(handles.show, 'Enable', 'on');
% disp(get(handles.stop, 'UserData'));
guidata(hObject,handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.hist)
    msgbox('Create a model first!','Error','Error');
    return
end
[filename, pathname] = uiputfile('saved\*.mat', 'Save as...');
if pathname==0
    return
end
m = handles.mass/handles.M;
r = handles.init_r;
v = handles.init_v;
for idx = 1:3
    r(idx) = handles.init_r(idx).scale(1/handles.AU);
    v(idx) = handles.init_v(idx).scale(1/handles.V);
end
method = handles.method;
time_step = handles.steps/handles.DAY;
iteration = handles.iter;
rep_freq = handles.rep_freq;
history = handles.hist;

model = Orbits(m, r, v, iteration, time_step, rep_freq, method, history);
save([pathname filename], 'model');
set(handles.alert, 'String', 'SAVE SUCCESS');


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('saved\*.mat', 'Select a file');
if pathname==0
    return
end
load([pathname filename], 'model');
handles.mass = model.m;
handles.init_r = model.r;
handles.init_v = model.v;
handles.iter = model.iteration;
handles.steps = model.time_step;
handles.rep_freq = model.rep_freq;
handles.method = model.method;
handles.hist = model.history;
if handles.method == "rk4"
    set(handles.methods, 'selectedobject', handles.rk4);
else
    set(handles.methods, 'selectedobject', handles.euler);
end
set(handles.mass1, 'String', model.m(1));
set(handles.mass2, 'String', model.m(2));
set(handles.mass3, 'String', model.m(3));
set(handles.r1_x, 'String', model.r(1).x);
set(handles.r1_y, 'String', model.r(1).y);
set(handles.r1_z, 'String', model.r(1).z);
set(handles.r2_x, 'String', model.r(2).x);
set(handles.r2_y, 'String', model.r(2).y);
set(handles.r2_z, 'String', model.r(2).z);
set(handles.r3_x, 'String', model.r(3).x);
set(handles.r3_y, 'String', model.r(3).y);
set(handles.r3_z, 'String', model.r(3).z);
set(handles.v1_x, 'String', model.v(1).x);
set(handles.v1_y, 'String', model.v(1).y);
set(handles.v1_z, 'String', model.v(1).z);
set(handles.v2_x, 'String', model.v(2).x);
set(handles.v2_y, 'String', model.v(2).y);
set(handles.v2_z, 'String', model.v(2).z);
set(handles.v3_x, 'String', model.v(3).x);
set(handles.v3_y, 'String', model.v(3).y);
set(handles.v3_z, 'String', model.v(3).z);
set(handles.iterations, 'String', model.iteration);
set(handles.timestep, 'String', model.time_step);
set(handles.rep_frq, 'String', model.rep_freq);
set(handles.alert, 'String', 'LOAD SUCCESS');
set(handles.cur_iter, 'String', '0');
set(handles.r1, 'String', '0x   0y   0z');
set(handles.v1, 'String', '0x   0y   0z');
set(handles.r2, 'String', '0x   0y   0z');
set(handles.v2, 'String', '0x   0y   0z');
set(handles.r3, 'String', '0x   0y   0z');
set(handles.v3, 'String', '0x   0y   0z');
set(handles.show, 'Enable', 'on');
set(handles.stop, 'Enable', 'on');
set(handles.save, 'Enable', 'on');
guidata(hObject, handles);



function az_Callback(hObject, eventdata, handles)
% hObject    handle to az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of az as text
%        str2double(get(hObject,'String')) returns contents of az as a double
az = str2double(get(handles.az, 'String'));
el = str2double(get(handles.el, 'String'));
view(az,el);


% --- Executes during object creation, after setting all properties.
function az_CreateFcn(hObject, eventdata, handles)
% hObject    handle to az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function el_Callback(hObject, eventdata, handles)
% hObject    handle to el (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of el as text
%        str2double(get(hObject,'String')) returns contents of el as a double
az = str2double(get(handles.az, 'String'));
el = str2double(get(handles.el, 'String'));
view(az,el);


% --- Executes during object creation, after setting all properties.
function el_CreateFcn(hObject, eventdata, handles)
% hObject    handle to el (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in def_view.
function def_view_Callback(hObject, eventdata, handles)
% hObject    handle to def_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.az, 'String', '45');
set(handles.el, 'String', '45');
az = 45;
el = 45;
view(az,el);
set(handles.reset, 'Enable', 'on');


% --- Executes on button press in status.
function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of status


% --- Executes on button press in est.
function est_Callback(hObject, eventdata, handles)
% hObject    handle to est (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of est


% --- Executes on button press in opn_options.
function opn_options_Callback(hObject, eventdata, handles)
% hObject    handle to opn_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.opn_options, 'UserData')
    set(handles.options, 'Visible', 'off');
    set(handles.opn_options, 'UserData', 0);
else
    set(handles.options, 'Visible', 'on');
    set(handles.opn_options, 'UserData', 1);
end
guidata(hObject, handles);
